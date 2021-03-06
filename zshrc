# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# do not share history instantly among terminals
unsetopt share_history
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ "$TERM" == "rxvt-unicode-256color" ]]; then
    ZSH_THEME="robbyrussell"
else
    ZSH_THEME="agnoster"
fi
DEFAULT_USER="monk"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
if [[ $(uname) == 'Darwin' ]]; then
    plugins=(git python pip vi-mode urltools brew vagrant laravel fancy-ctrl-z)
else
    plugins=(git python pip vi-mode systemd urltools archlinux svn systemd-user)
fi

source $ZSH/oh-my-zsh.sh
source /usr/local/etc/profile.d/z.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# load local custom scripts
if [[ -f ~/.zshrc_private ]]; then
    source ~/.zshrc_private
fi
if [[ -f ~/.zshrc_work ]]; then
    source ~/.zshrc_work
fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

##################################################
# Functions
##################################################
wcp() { # Count processes
    if [ $# -eq 0 ]; then
        echo 'Which process to count ?' >&2
        return 1
    fi
    while [ $# -gt 0 ]; do
        cnt=`ps aux|grep -v grep|grep $1|wc -l`
        echo -e $1":\t\t"$cnt
        shift
    done
}
mvgo() { # Move and go
    if [ -d "$2" ];then
        mv $1 $2 && cd $2
    else
        mv $1 $2
    fi
}
clock() { # CLI clock
    while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done
}
# ptyless () { # Colorful less
    # zmodload zsh/zpty
    # zpty ptyless ${1+"$@"}            # ptyless 是这个 pty 的名字
    # zpty -r ptyless > /tmp/ptyless.$$ # 读取数据到临时文件。不知为什么直接输出到管道不行
    # less /tmp/ptyless.$$
    # rm -f /tmp/ptyless.$$
    # zpty -d ptyless                   # 删除已完成的 pty
# }
ptyrun () {
    local ptyname=pty-$$
    zmodload zsh/zpty
    zpty $ptyname ${1+"$@"}
    if [[ ! -t 1 ]]; then
        setopt local_traps
        trap '' INT
    fi
    zpty -r $ptyname
    zpty -d $ptyname
}
ptyless () {
    ptyrun $@ | less
}
orphans() { # Remove orphan packages in archlinux
    if [[ ! -n $(pacman -Qdt) ]]; then
        echo no orphans to remove
    else
        sudo pacman -Rns $(pacman -Qdtq)
    fi
}
copy_path() {
    readlink -f "$1"|pbcopy
}
lsf() { # List files whose names match the given pattern
    ! [ $# -eq 1 -o $# -eq 2 ] && echo "lsf FILENAME PATH" >&2 && return 1
    [ $# -eq 1 ] && UNDER_PATH="." || UNDER_PATH="$2"
    find "$UNDER_PATH" -name "$1" -print
}
chpwd_functions=( chpwd_octopress )
# Check tcp and dup port
chktcp() {
    eval "lsof -i tcp:$1"
}
chkudp() {
    eval "lsof -i udp:$1"
}
# Use ssh to access a given host
# eg. goto 3 <=> ssh root@192.168.1.3
goto() {
    test $# -eq 0 && echo "Which host do you want to access ?" >&2 && return 1
    ipseg=`[ -z "$DONIE_IP_SEG" ] && echo "192.168.1" || echo "$DONIE_IP_SEG"`
    account=`[ $# -ge 2 ] && echo "$2" || echo "root"`
    ssh "$account@$ipseg.$1"
}
# Use screen to access a ttyUSBx device
# eg. serial 0 <=> sudo screen /dev/ttyUSB0 115200
serial() {
    test $# -eq 0 && echo "Which ttyUSB device do you want to access ?" >&2 && return 1
    if [[ $(uname) == 'Linux' ]]; then
        sudo screen "/dev/ttyUSB$1" 115200
    else if [[ $(uname) == 'Darwin' ]]
        sudo screen "/dev/tty.usbserial" 115200
    fi
}

# Display vi-mode
VIMODE='-- INSERT --'
function zle-line-init zle-keymap-select {
    VIMODE="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    zle reset-prompt
}
zle -N zle-line-init 
zle -N zle-keymap-select
RPROMPT='%{$fg[green]%}${VIMODE}%{$reset_color%}'

# Fuzzy find git branch
fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}
fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}
alias fgb='fzf-git-branch'
alias fgco='fzf-git-checkout'

##################### Functions End ##################################

# Example aliases
alias config="nvim ~/.zshrc && refresh"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias refresh=". ~/.zshrc"

# Customize to your needs...
PAGER='less -X -M'
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS='-SRXF'
export CLICOLOR=1

# System commands aliases
if [[ $(uname) == "Linux" ]]; then
    alias ls='ls --color=auto'
    export LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=31:*.rpm=90'
else
    alias ls='ls -G'
    export LSCOLORS=dxfxcxdxbxegedabagacad
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
if [[ $(uname) == "Darwin" ]]; then
    export PATH="$HOME/Bin:$PATH"
    # export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
    # export PATH="/usr/local/opt/php@7.2/bin:$PATH"
fi
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="${HOME}/.vim/plugged/phpactor/bin:$PATH"

# Golang
export GOROOT="/usr/local/bin"

# wine
export WINEARCH=win32

# VPS
export VPS_PORT=26681

# Locale
export LANG=en_US.UTF-8

# Homebrew
if [ -f /usr/local/bin/brew ]; then
    export HOMEBREW_GITHUB_API_TOKEN="55b40e6e6dbee769353a17567859b4ec9296d7ae"
fi

alias l='ls -CF'
alias ll='ls -alFh'
alias rll='sudo ls -alFh'
alias r='rm -f'
alias rr='rm -rf'
alias ka='killall'
alias k9="kill -9"
alias cls='clear'
#alias +x='chmod +x'
alias 777='chmod 777'
alias 755='chmod 755'
alias 744='chmod 744'
alias 700='chmod 700'
alias 600='chmod 600'
alias 644='chmod 644'
alias envs="$EDITOR ~/.profile && source ~/.profile"
alias flushdns='sudo killall -HUP mDNSResponder'


# Platform specific aliases
if [[ $(uname) == "Linux" ]]; then
    alias mhk='gvim ~/.xbindkeysrc'
    alias thk="xbindkeys --key"
    alias rhk="killall xbindkeys && xbindkeys &"
    alias shk='gvim ~/.xbindkeysrc'
    alias pkg='nocorrect yaourt -Ss'
    # alias fix='export LC_ALL=en_US.UTF-8 && yaourt -S --noconfirm'
    # alias ufix='yaourt -Rc'
    alias fix='export LC_ALL=en_US.UTF-8 && nocorrect yaourt -S --noconfirm'
    alias ufix='nocorrect sudo pacman -Rnsc'
    alias yaupga='yaourt -Syua --noconfirm'
    alias yag='yaourt -G'
    alias vsys='virsh -c qemu:///system'
    alias vv='virt-viewer -c qemu:///system'
elif [[ $(uname) == "Darwin" ]]; then
    alias updatedb='sudo /usr/libexec/locate.updatedb'
fi

# Vim aliases
alias v='nvim'
alias vd='vimdiff'
alias sv='sudo nvim'
if [[ $(uname) == "Darwin" ]]; then
    alias gv='mvim'
    alias gd='mvimdiff'
    alias sgv='sudo mvim'
else
    alias gv='gvim'
    alias gd='gvimdiff'
    alias sgv='sudo gvim'
    alias vr='vimr'
fi

# Git aliases
alias diffhead='git difftool HEAD'
alias gdiffhead='git difftool --gui HEAD'
alias smpull='git submodule foreach git pull origin master'
alias gensshkey='ssh-keygen -t rsa -C "donie.leigh@gmail.com"'
alias gll="git log --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit --no-merges"
alias glla="git log --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit --no-merges --author"
alias gllg="git log --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit --no-merges --grep"

# Distribution specific aliases
alias english='export LC_ALL=en_US.UTF-8'
alias fuckgfw='export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;'
alias fuckme='unset http_proxy https_proxy'
alias lsp='nocorrect ps aux|grep -v grep|grep'
alias a='apack'
alias x='aunpack'
alias lsgbkzip='lsar -e gb18030'
alias ungbkzip='unar -e gb18030'
alias lns='ln -s'
alias lssrv='netstat -tulnp'
alias lsconn='netstat -atunp'
alias follow='tail -f -n 100'
if [[ `uname` != 'Darwin' ]]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    alias toclip='xclip -sel clip <'
    alias synctime='sudo ntpdate -u ntp.ubuntu.com && sudo hwclock -w'
    alias convid='java -jar /opt/id3iconv-0.2.1.jar -e GBK *.mp3'
    alias split_ape='cue2tracks -c flac -f gb18030 -o "/home/lenin/music/%P-%A/%N-%t"'
    alias killer='nocorrect killer.sh'
    alias unlockpacman='sudo rm -r /var/lib/pacman/db.lck'
else
    alias start-nginx='sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
    alias stop-nginx='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
fi

# Development
# alias syncxidi='sudo rsync -avz --delete --password-file=/etc/rsyncd/rsyncd.pass $HOME/workspace monster@172.16.20.111::xidi'
# alias flog="find storage/logs -name '*.log'|xargs ls -lt|awk '{print \$9}'|head -n 1|xargs tail -fn 100"
alias flog='ls -t storage/logs/* | head -n 1 | xargs tail -f -n 100'

# Misc
# alias ut="./run --colors=always"

# fix grep complainings
# alias grep="/usr/bin/grep -a $GREP_OPTIONS"
# unset GREP_OPTIONS

alias phpsh="php -c ~/.php.ini -a"
alias coverage='phpunitat57 --coverage-html ./report --stop-on-failure'

# Hashes
if [[ `uname` == 'Darwin' ]]; then
    hash -d shell="$HOME/Projects/shell"
    hash -d blog="$HOME/Projects/blog"
    hash -d post="$HOME/Projects/blog/source/_posts"
    hash -d www="$HOME/Sites"
else
    hash -d shell="$HOME/dev/shell"
    hash -d blog="$HOME/dev/blog"
    hash -d post="$HOME/dev/blog/source/_posts"
    hash -d www="/srv/http/"
fi

# Key bindings
bindkey "^R" history-incremental-search-backward

# nvm
if [[ `uname` == 'Darwin' ]]; then
    export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# java
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# PHPUnit
# export XDEBUG_CONFIG="idekey=VSCODE profiler_enable=1"
export XDEBUG_CONFIG="idekey=VSCODE"
export XDEBUG_SESSION="VSCODE"

# Setup tab and window title functions for iterm2
# iterm behaviour: until window name is explicitly set, it'll always track tab title.
# So, to have different window and tab titles, iterm_window() must be called
# first. iterm_both() resets this behaviour and has window track tab title again).
# Source: http://superuser.com/a/344397
set_iterm_name() {
    mode=$1; shift
    echo -ne "\033]$mode;$@\007"
}
iterm_both () { set_iterm_name 0 $@; }
iterm_tab () { set_iterm_name 1 $@; }
iterm_window () { set_iterm_name 2 $@; }
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin load sticklerm3/alehouse
zplugin snippet OMZ::plugins/composer/composer.plugin.zsh

alias rd='~/.ssh/ssh zyb_jump'
# alias rm='rmtrash'
# alias rmdir='rmdirtrash'
# alias sudo='sudo '

alias fg1='fg %1'
alias fg2='fg %2'
alias fg3='fg %3'
alias fg4='fg %4'
alias fg5='fg %5'

autoload -U edit-command-line
zle -N edit-command-line 
bindkey "^X^E" edit-command-line
