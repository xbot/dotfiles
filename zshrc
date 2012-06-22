# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
alias config="vim ~/.zshrc && refresh"
alias ohmyzsh="vim ~/.oh-my-zsh"
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
plugins=(git python pip vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PAGER='less -X -M'
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
export CLICOLOR=1

# System commands aliases
if [[ $(uname) == "Linux" ]]; then
    alias ls='ls --color=auto'
    export LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=31:*.rpm=90'
else
    alias ls='ls -G'
    export LSCOLORS=dxfxcxdxbxegedabagacad
fi

#alias l='ls -CF'
#alias ll='ls -l'
#alias la='ls -Al'
alias r='rm -f'
alias rr='rm -rf'
alias ka='killall'
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
    alias pkg='yaourt -Ss'
    alias fix='export LC_ALL=en_US.UTF-8 && yaourt -S --noconfirm'
    alias ufix='yaourt -Rs'
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
alias pull='git pull'
alias push='git push -u origin'
alias commit='git commit'
alias amend='git commit --amend'
alias status='git status'
alias add='git add'
alias diffhead='git difftool HEAD'
alias gdiffhead='git difftool --gui HEAD'
alias clone='git clone'
alias merge='git merge'

# SSH aliases
alias cld='ssh -i ~/.ssh/cloud'
alias ccp='scp -i ~/.ssh/cloud'

# Distribution specific aliases
alias convid='java -jar /opt/id3iconv-0.2.1.jar -e GBK *.mp3'
alias split_ape='cue2tracks -c flac -f gb18030 -o "/home/lenin/music/%P-%A/%N-%t"'
alias english='export LC_ALL=en_US.UTF-8'
alias httpproxy='export http_proxy=127.0.0.1:2010'
alias lsp='ps aux|grep -v grep|grep'
alias ff='firefox'
alias z='apack'
alias x='aunpack'
alias brightness='cat /sys/class/backlight/acpi_video0/brightness'
alias cleantracefiles='sudo rm /tmp/trace.*.xt'
alias rcstart='sudo rc.d start'
alias rcstop='sudo rc.d stop'
alias rcoo='sudo rc.d restart'
alias my='mysql -uroot -pdkstFeb1st'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# Count processes
wcp()
{
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
# Move directories
mvd()
{
    if [ $# -ne 2 ]; then
        echo 'mvd SRC TARGET' >&2
        return 1
    fi
    cp -rf $1 $2 && rm -rf $1
}
# Move and go
mvgo()
{
    if [ -d "$2" ];then
        mv $1 $2 && cd $2
    else
        mv $1 $2
    fi
}
# CLI clock
clock()
{
    while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done
}
# Colorful less
ptyless () {
    zmodload zsh/zpty
    zpty ptyless ${1+"$@"}            # ptyless 是这个 pty 的名字
    zpty -r ptyless > /tmp/ptyless.$$ # 读取数据到临时文件。不知为什么直接输出到管道不行
    less /tmp/ptyless.$$
    rm -f /tmp/ptyless.$$
    zpty -d ptyless                   # 删除已完成的 pty
}
