set -o vi

alias reload='. ~/.bashrc'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -Al'
alias ..='cd ..'
alias rf="rm -rf"

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

set bell-style none

PS1='[\u@\h \W]\$ '
PAGER='less -X -M'
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

source ~/.profile
