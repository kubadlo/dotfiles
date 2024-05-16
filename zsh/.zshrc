# Use Starship as a default prompt
eval "$(starship init zsh)"

# Ignore case for autocomplete
compctl -M "" "m:{a-zA-Z}={A-Za-z}"

# Better defaults
alias bat="bat -pp --theme=gruvbox-dark"
alias fd="fd -Hi"

# Improve file listing
alias ls="ls -lhG"
alias ll="ls -lhAG"

# Store go modules in hidden folder
export GOPATH="$HOME/.go"

# Use JDK installed via homebrew as a default one
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
