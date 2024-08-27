# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
if [[ $(hostname) == 'nas' ]]; then
    ZSH_CUSTOM=/mnt/user/dropbox/Dropbox/Mackup/.oh-my-zsh/custom
else
    ZSH_CUSTOM=${HOME}/Dropbox/Mackup/.oh-my-zsh/custom
fi

source $ZSH/oh-my-zsh.sh

[[ -f ~/.zshrc_aliases ]] && source ~/.zshrc_aliases

# ------ zinit section ------{{{

### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

### End of Zinit's installer chunk

if [[ $(uname) == 'Darwin' ]]; then
    zinit load sticklerm3/alehouse
    zplugin snippet OMZP::brew
elif [[ $(hostname) == 'archer' ]]; then
    zplugin snippet OMZP::systemd
    zplugin snippet OMZP::archlinux
fi

zi snippet OMZP::composer
zi snippet OMZP::fancy-ctrl-z
zi snippet OMZP::git
zi snippet OMZP::gpg-agent
zi snippet OMZP::laravel
zi snippet OMZP::pip
zi snippet OMZP::python
zi snippet OMZP::urltools
zi snippet OMZP::vi-mode

zi light Aloxaf/fzf-tab
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# Be compatible with the tokyonight-day theme
zstyle ":fzf-tab:*" fzf-flags \
--color "fg:#3760bf,bg:#e1e2e7,hl:#b15c00,fg+:#3760bf,bg+:#e1e2e7,hl+:#b15c00" \
--color "info:#2e7de9,prompt:#2e7de9,pointer:#c64343,marker:#587539,spinner:#587539,header:#587539"

if [[ -z "$TMUX" ]]; then
   zi light marlonrichert/zsh-autocomplete
   zi light zsh-users/zsh-autosuggestions
   zi light zsh-users/zsh-syntax-highlighting
fi
zi ice depth=1; zinit light romkatv/powerlevel10k
zi light Tarrasch/zsh-autoenv
zi light akarzim/zsh-docker-aliases

zi light skywind3000/z.lua
zi light changyuheng/fz
FZ_HISTORY_CD_CMD="_zlua"

# zi snippet $ZSH_CUSTOM/plugins/composer/composer.plugin.zsh
zi snippet $ZSH_CUSTOM/plugins/brew/brew.plugin.zsh
zi snippet $ZSH_CUSTOM/plugins/docker/docker.plugin.zsh
zi snippet $ZSH_CUSTOM/plugins/git/git.plugin.zsh
zi snippet $ZSH_CUSTOM/plugins/laravel/laravel.plugin.zsh

# }}}

# ------ p10k section ------{{{

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# }}}

# # An alternative to p10k
# eval "$(starship init zsh)"

# do not share history instantly among terminals
unsetopt share_history
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
[ ! -f ~/.zsh/_hugo ] && hugo version > /dev/null 2>&1 && hugo completion zsh > ~/.zsh/_hugo
autoload -Uz compinit && compinit

DEFAULT_USER="donie"

# Display vi-mode
VIMODE='-- INSERT --'
function zle-line-init zle-keymap-select {
    VIMODE="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    zle reset-prompt
}
zle -N zle-line-init 
zle -N zle-keymap-select
RPROMPT='%{$fg[green]%}${VIMODE}%{$reset_color%}'

type rbenv &> /dev/null && eval "$(rbenv init -)"

type pyenv &> /dev/null
if [[ $? == 0 ]]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Key bindings
bindkey "^R" history-incremental-search-backward

autoload -U edit-command-line
zle -N edit-command-line 
bindkey "^X^E" edit-command-line

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### fzf settings ###{{{

[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

# tokyonight-day
export FZF_DEFAULT_OPTS='--color=fg:#3760bf,bg:#e1e2e7,hl:#b15c00 --color=fg+:#3760bf,bg+:#e1e2e7,hl+:#b15c00 --color=info:#2e7de9,prompt:#2e7de9,pointer:#c64343 --color=marker:#587539,spinner:#587539,header:#587539'

# # dracula
# export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# # onedark
# source ~/Projects/3rd-party/base16-fzf/bash/base16-onedark.config

# }}}

# init lua environment variables
which luarocks > /dev/null 2>&1 && eval $(luarocks path)

# Unlock all ssh keys with keychain.
eval $(/usr/bin/ssh-agent -s) > /dev/null
if [[ $(uname) == 'Darwin' ]]; then
    /usr/bin/ssh-add --apple-load-keychain > /dev/null 2>&1
fi

# # Start ssh-agent after login
# if [[ $(hostname) == 'archer' ]]; then
#     if ! pgrep ssh-agent > /dev/null; then
#         eval `ssh-agent -s` > /dev/null
#     fi
#     # if [ -x /usr/bin/keychain ]; then
#     #     eval $(keychain --eval --quiet "$HOME/.ssh/rightcapital")
#     # fi
# fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
