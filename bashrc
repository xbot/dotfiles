# General settings
set -o vi
set bell-style none
PS1='[\u@\h \W]\$ '
PAGER='less -X -M'
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
export CLICOLOR=1
export EDITOR='vim'

if [ $(uname) == "Darwin" ]; then
    bashrc='~/.bash_profile'
else
    bashrc='~/.bashrc'
fi

# Sourcings
source ~/.profile

# Bash-completion
if [ $(uname) == "Darwin" ]; then
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
else
    [ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion
fi
complete -cf sudo

# Aliases for ease of managing bashrc
alias reload="source $bashrc"
alias config="vim $bashrc"

# System commands aliases
if [ $(uname) == "Linux" ]; then
    alias ls='ls --color=auto'
    export LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=31:*.rpm=90'
else
    alias ls='ls -G'
    export LSCOLORS=dxfxcxdxbxegedabagacad
fi

alias l='ls -CF'
alias ll='ls -l'
alias la='ls -Al'
alias ..='cd ..'
alias r='rm -f'
alias rr='rm -rf'
alias ka='killall'
alias +x='chmod +x'
alias cls='clear'

# Platform specific aliases
if [ $(uname) == "Linux" ]; then
    alias mhk='gvim ~/.xbindkeysrc'
    alias thk="xbindkeys --key"
    alias rhk="killall xbindkeys && xbindkeys &"
    alias shk='gvim ~/.xbindkeysrc'
    alias findpkg='yaourt -Ss'
    alias fix='export LC_ALL=en_US.UTF-8 && yaourt -S --noconfirm'
    alias unfix='yaourt -Rs'
    alias vsys='virsh -c sys'
    alias vv='virt-viewer -c qemu:///system'
elif [ $(uname) == "Darwin" ]; then
    alias updatedb='sudo /usr/libexec/locate.updatedb'
fi

# Vim aliases
alias v='vim'
alias vd='vimdiff'
if [ $(uname) == "Darwin" ]; then
    alias gv='mvim'
    alias gd='mvimdiff'
else
    alias gv='gvim'
    alias gd='gvimdiff'
fi

# Git aliases
alias pull='git pull'
alias push='git push -u origin master'
alias commit='git commit'
alias amend='git commit --amend'
alias status='git status'
alias add='git add'
alias diffhead='git diff HEAD'

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
