# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# do not share history instantly among terminals
unsetopt share_history
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
[ ! -f ~/.zsh/_hugo ] && hugo version > /dev/null 2>&1 && hugo completion zsh > ~/.zsh/_hugo
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

DEFAULT_USER="donie"

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
    plugins=(git python pip vi-mode urltools brew vagrant laravel fancy-ctrl-z zsh-docker-aliases gpg-agent)
else
    plugins=(git python pip vi-mode systemd urltools archlinux svn zsh-docker-aliases)
fi

source $ZSH/oh-my-zsh.sh

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

# fzf settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

# # base16 themes
# # local theme_name="tokyonight-light"
# local theme_name="horizon-dark"
# local theme_file="$HOME/Projects/3rd-party/base16-fzf/bash/base16-$theme_name.config"
# [[ -f $theme_file ]] && source $theme_file

# # Dracula theme
# export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -f ~/.zshrc_aliases ]] && source ~/.zshrc_aliases

# fasd
eval "$(fasd --init auto)"

# init lua environment variables
which luarocks > /dev/null 2>&1 && $(luarocks path)

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

zinit ice if'[[ $(uname) == "Darwin" ]]'; zinit load sticklerm3/alehouse
zplugin snippet OMZ::plugins/composer/composer.plugin.zsh
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-autosuggestions
zinit light Tarrasch/zsh-autoenv
zinit light wookayin/fzf-fasd
zinit light Aloxaf/fzf-tab
