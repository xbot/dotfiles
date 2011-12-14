# General settings
set -o vi
set bell-style none
PS1='[\u@\h \W]\$ '
PAGER='less -X -M'
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# Sourcings
source ~/.profile

# Aliases for ease of managing bashrc
alias reload='. ~/.bashrc'
alias config='vim ~/.bashrc'

# System commands aliases
alias l='ls -CF'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -Al'
alias ..='cd ..'
alias r='rm -f'
alias rr='rm -rf'
alias ka='killall'
alias +x='chmod +x'
alias cls='clear'

# Vim aliases
alias v='vim'
alias vd='vimdiff'
alias gv='gvim'
alias gd='gvimdiff'

# Git aliases
alias pull='git pull'
alias push='git push -u origin master'
alias commit='git commit'
alias amend='git commit --amend'
alias status='git status'
alias diffhead='git diff HEAD'

# Distribution specific aliases
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
alias ff='firefox'

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
