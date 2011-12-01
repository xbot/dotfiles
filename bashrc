set -o vi

alias reload='. ~/.bashrc'
alias config='vim ~/.bashrc'

alias l='ls -CF'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -Al'
alias ..='cd ..'
alias r='rm -f'
alias rr='rm -rf'
alias ka='killall'

alias v='vim'
alias gv='gvim'

alias convid='java -jar /opt/id3iconv-0.2.1.jar -e GBK *.mp3'
alias mhk='gvim ~/.xbindkeysrc'
alias thk="xbindkeys --key"
alias rhk="killall xbindkeys && xbindkeys &"
alias shk='gvim ~/.xbindkeysrc'
alias split_ape='cue2tracks -c flac -f gb18030 -o "/home/lenin/music/%P-%A/%N-%t"'
alias findpkg='yaourt -Ss'
alias fix='export LC_ALL=en_US.UTF-8 && yaourt -S --noconfirm'
alias unfix='yaourt -Rs'
alias english='export LC_ALL=en_US.UTF-8'
alias httpproxy='export http_proxy=127.0.0.1:2010'
alias lsp='ps aux|grep -v grep|grep'

set bell-style none

PS1='[\u@\h \W]\$ '
PAGER='less -X -M'
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

source ~/.profile

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
