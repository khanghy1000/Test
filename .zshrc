source ${ZDOTDIR:-~}/.antidote/antidote.zsh
# Set compstyle
zstyle ':plugin:ez-compinit' 'compstyle' 'ohmy'
# Load plugins
antidote load

# Setup custom configs
ZSH_CONFIG=$HOME/.config/zsh-custom
source $ZSH_CONFIG/env
source $ZSH_CONFIG/alias

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

eval "$(starship init zsh)"

