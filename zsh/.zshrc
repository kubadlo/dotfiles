# Prompt settings
eval "$(starship init zsh)"

# Ignore case for autocomplete
compctl -M '' 'm:{a-zA-Z}={A-Za-z}'

# Aliases
alias ls="ls -lh --color=auto"
alias ll="ls -lha --color=auto"
alias cat="bat -pP --theme=base16"
