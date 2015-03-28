# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# do not share history instantly among terminals
unsetopt share_history

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

# Example aliases
alias config="gvim ~/.zshrc && refresh"
alias ohmyzsh="gvim ~/.oh-my-zsh"
alias refresh=". ~/.zshrc"

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
plugins=(git python pip vi-mode systemd urltools archlinux svn)

source $ZSH/oh-my-zsh.sh
# source /usr/share/zsh/site-contrib/powerline.zsh
source ~/dev/z/z.sh

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
    alias ufix='nocorrect sudo pacman -Rsc'
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

# SSH aliases
alias viewlogtestsrv='ssh -i ~/.ssh/chanjet_testsrv root@10.10.11.221 "tail -f /opt/geronimo/var/log/geronimo.log"'
alias viewouttestsrv='ssh -i ~/.ssh/chanjet_testsrv root@10.10.11.221 "tail -f /opt/geronimo/var/log/geronimo.out"'
alias viewlogdevsrv='ssh -i ~/.ssh/chanjet_devsrv root@10.10.11.218 "tail -f /opt/geronimo/var/log/geronimo.log"'
alias viewlogubsrv='ssh -i ~/.ssh/chanjet_testsrv root@172.18.8.145 "tail -f /opt/geronimo/var/log/geronimo.log"'

# Distribution specific aliases
alias convid='java -jar /opt/id3iconv-0.2.1.jar -e GBK *.mp3'
alias split_ape='cue2tracks -c flac -f gb18030 -o "/home/lenin/music/%P-%A/%N-%t"'
alias english='export LC_ALL=en_US.UTF-8'
# alias httpproxy='export http_proxy=127.0.0.1:8087'
alias httpproxy='export http_proxy=127.0.0.1:1894'
alias httpsproxy='export HTTPS_PROXY=socks5://127.0.0.1:1080'
alias lsp='nocorrect ps aux|grep -v grep|grep'
alias ff='firefox'
alias a='apack'
alias x='aunpack'
alias cleantracefiles='sudo rm /tmp/trace.*.xt'
alias my='mysql -uroot -p5G10color'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias toclip='xclip -sel clip <'
alias synctime='sudo ntpdate -u ntp.ubuntu.com && sudo hwclock -w'
alias post='create_new_post'
alias killer='nocorrect killer.sh'
alias regenmenu='mmaker -f -t Lilyterm MyGTKMenu'
alias unlockpacman='sudo rm -r /var/lib/pacman/db.lck'
alias lsgbkzip='lsar -e gb18030'
alias ungbkzip='unar -e gb18030'
alias remap='xmodmap .Xmodmap'

# Development
alias yiic='/srv/http/yii/framework/yiic'
alias syncxidi='sudo rsync -avz --delete --password-file=/etc/rsyncd/rsyncd.pass /home/monk/workspace monster@172.16.20.111::xidi'

#Maven
alias makeframe='mvn clean install -Dmaven.test.skip=true'

# Misc
alias rake='nocorrect rake'
alias gotosrv="ssh root@172.16.20.111"
alias gotodo="ssh root@104.236.135.204"

# Hashes
hash -d cust="/home/monk/workspace/csp_web_customer_v1"
hash -d todo="/home/monk/workspace/csp_web_todo"
hash -d desktop="/home/monk/workspace/csp_web_desktop"
hash -d common="/home/monk/workspace/csp_web_desktop/src/main/webapp/app/common"
hash -d dog="/home/monk/workspace/DualHead-Watchdog-NG"
hash -d shell="/home/monk/dev/shell"
hash -d blog="/home/monk/dev/octopress"
hash -d post="/home/monk/dev/octopress/source/_posts"
hash -d webroot="/home/monk/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/csp_web_todo/"
hash -d www="/srv/http/"
hash -d flame="/srv/http/flamework"
hash -d yii="/srv/http/yii/framework"

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
        sudo pacman -Rs $(pacman -Qdtq)
    fi
}
create_new_post() {
   test $# -ne 1 && echo "Invalid title" >&2 && return 1
   cd ~/dev/octopress
   rake new_post\["$1"\]
}
copy_path() {
    readlink -f "$1"|pbcopy
}
deploydevsrv() {
    scp -i ~/.ssh/chanjet_devsrv "$1" root@10.10.11.218:/opt/geronimo/deploy/
    # scp -i ~/.ssh/chanjet_devsrv "$1" root@10.10.11.218:/opt/tomcat/webapps/"$2"
}
deploytestsrv() {
    scp -i ~/.ssh/chanjet_testsrv "$1" root@10.10.11.221:/opt/geronimo/deploy/
    # scp -i ~/.ssh/chanjet_testsrv "$1" root@10.10.11.221:/opt/tomcat/webapps/"$2"
}
deployubsrv() {
    scp -i ~/.ssh/chanjet_testsrv "$1" root@172.18.8.145:/opt/geronimo/deploy/
}
sendubsvr() {
    scp -i ~/.ssh/chanjet_testsrv "$1" root@172.18.8.145:/opt/
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

# source /etc/profile.d/autojump.sh
