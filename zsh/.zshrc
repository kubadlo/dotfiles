# Use Starship as a default prompt
eval "$(starship init zsh)"

# Ignore case for autocomplete
compctl -M "" "m:{a-zA-Z}={A-Za-z}"

# Better defaults
alias cat="bat -pp --theme=base16"
alias fd="fd -Hi"

# Improve file listing
alias ls="ls -lh --color=auto"
alias ll="ls -lha --color=auto"

# Store go modules in hidden folder
export GOPATH="$HOME/.go"
