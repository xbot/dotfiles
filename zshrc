# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# do not share history instantly among terminals
unsetopt share_history
zstyle ':completion:*' rehash true

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
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
if [[ `hostname` == "xidi-donieli" ]]; then
    plugins=(git python pip systemd urltools debian svn vi-mode archlinux)
else
    plugins=(git python pip vi-mode systemd urltools archlinux svn)
fi

source $ZSH/oh-my-zsh.sh
source ~/dev/z/z.sh

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
ptyless () { # Colorful less
    zmodload zsh/zpty
    zpty ptyless ${1+"$@"}            # ptyless 是这个 pty 的名字
    zpty -r ptyless > /tmp/ptyless.$$ # 读取数据到临时文件。不知为什么直接输出到管道不行
    less /tmp/ptyless.$$
    rm -f /tmp/ptyless.$$
    zpty -d ptyless                   # 删除已完成的 pty
}
orphans() { # Remove orphan packages in archlinux
    if [[ ! -n $(pacman -Qdt) ]]; then
        echo no orphans to remove
    else
        sudo pacman -Rns $(pacman -Qdtq)
    fi
}
writeblog() {
   test $# -ne 1 && echo "Invalid title" >&2 && return 1
   cd ~/dev/octopress
   rake new_post\["$1"\]
}
copy_path() {
    readlink -f "$1"|pbcopy
}
lsf() { # List files whose names match the given pattern
    ! [ $# -eq 1 -o $# -eq 2 ] && echo "lsf FILENAME PATH" >&2 && return 1
    [ $# -eq 1 ] && UNDER_PATH="." || UNDER_PATH="$2"
    find "$UNDER_PATH" -name "$1" -print
}
chpwd_octopress() {
    OCTOPRESS=~/dev/octopress
    if [[ "$PWD" == "$OCTOPRESS" ]]; then
        source /usr/bin/virtualenvwrapper.sh
        workon blog_env
    fi
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
    sudo screen "/dev/ttyUSB$1" 115200
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

##################### Functions End ##################################

# Example aliases
alias config="gvim ~/.zshrc && refresh"
alias ohmyzsh="gvim ~/.oh-my-zsh"
alias refresh=". ~/.zshrc"

# Customize to your needs...
PAGER='less -X -M'
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
export CLICOLOR=1
if [[ "$TERM" == "xterm" ]]; then
    export TERM='xterm-256color'
fi

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

# wine
export WINEARCH=win32

alias l='ls -CF'
#alias ll='ls -l'
#alias la='ls -Al'
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
    alias vsys='virsh -c qemu:///system'
    alias vv='virt-viewer -c qemu:///system'
elif [[ $(uname) == "Darwin" ]]; then
    alias updatedb='sudo /usr/libexec/locate.updatedb'
fi

# Vim aliases
alias v='vim'
alias vd='vimdiff'
alias sv='sudo vim'
if [[ $(uname) == "Darwin" ]]; then
    alias gv='mvim'
    alias gd='mvimdiff'
    alias sgv='sudo mvim'
else
    alias gv='gvim'
    alias gd='gvimdiff'
    alias sgv='sudo gvim'
fi

# Git aliases
alias diffhead='git difftool HEAD'
alias gdiffhead='git difftool --gui HEAD'
alias smpull='git submodule foreach git pull origin master'
alias gensshkey='ssh-keygen -t rsa -C "donie.leigh@gmailcom"'

# svn aliases
alias sst='svn status'
alias sud='svn update'

# Distribution specific aliases
alias convid='java -jar /opt/id3iconv-0.2.1.jar -e GBK *.mp3'
alias split_ape='cue2tracks -c flac -f gb18030 -o "/home/lenin/music/%P-%A/%N-%t"'
alias english='export LC_ALL=en_US.UTF-8'
alias httpproxy='export http_proxy=127.0.0.1:8123'
alias httpsproxy='export HTTPS_PROXY=socks5://127.0.0.1:1080'
alias lsp='nocorrect ps aux|grep -v grep|grep'
alias a='apack'
alias x='aunpack'
alias my='mysql -uroot -p5G10color'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias toclip='xclip -sel clip <'
alias synctime='sudo ntpdate -u ntp.ubuntu.com && sudo hwclock -w'
alias killer='nocorrect killer.sh'
alias unlockpacman='sudo rm -r /var/lib/pacman/db.lck'
alias lsgbkzip='lsar -e gb18030'
alias ungbkzip='unar -e gb18030'
alias lns='ln -s'
alias rake='nocorrect rake'
alias lssrv='netstat -tulnp'
alias lsconn='netstat -atunp'

# Development
alias yiic='/srv/http/yii/framework/yiic'
# alias syncxidi='sudo rsync -avz --delete --password-file=/etc/rsyncd/rsyncd.pass /home/monk/workspace monster@172.16.20.111::xidi'

# Misc
alias gotosrv="ssh root@172.16.20.111"
alias gotodo="ssh root@104.236.135.204"
alias gototest="ssh zengbo@192.168.80.10"

# fix grep complainings
alias grep="/usr/bin/grep -a $GREP_OPTIONS"
unset GREP_OPTIONS

alias phpsh="php -c ~/.php.ini -a"

# Hashes
hash -d shell="/home/monk/dev/shell"
hash -d blog="/home/monk/dev/octopress"
hash -d post="/home/monk/dev/octopress/source/_posts"
hash -d www="/srv/http/"
hash -d flame="/srv/http/flamework"
hash -d yii="/srv/http/yii/framework"

# Key bindings
bindkey "^R" history-incremental-search-backward
