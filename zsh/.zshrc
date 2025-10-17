# Use Starship as a default prompt
eval "$(starship init zsh)"

# Load Node.js version manager
eval "$(nodenv init - zsh)"

# Load completion system
autoload -Uz compinit && compinit

# Ignore case for autocomplete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Enable vi keybindings
bindkey -v

# Improve file listing
alias ls="ls -lhG"
alias ll="ls -lhAG"
