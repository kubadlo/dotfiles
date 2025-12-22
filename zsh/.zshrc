# Use Starship as a default prompt
eval "$(starship init zsh)"

# Enable vi keybindings
bindkey -v

# Enable command autocomplete
autoload -Uz compinit && compinit

# Ignore case for autocomplete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Improve file listing
alias ls="ls -lhG"
alias ll="ls -lhAG"
