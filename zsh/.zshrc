# Use Starship as a default prompt
eval "$(starship init zsh)"

# Load Node.js version manager
eval "$(nodenv init - zsh)"

# Ignore case for autocomplete
compctl -M "" "m:{a-zA-Z}={A-Za-z}"

# Improve file listing
alias ls="ls -lhG"
alias ll="ls -lhAG"

# Store go modules in hidden folder
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin"
