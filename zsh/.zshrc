# Use Starship as a default prompt
eval "$(starship init zsh)"

# Ignore case for autocomplete
compctl -M "" "m:{a-zA-Z}={A-Za-z}"

# Aliases
alias bat="bat -pP --theme=base16"
alias fd="fd -H"
alias ls="ls -lh --color=auto"
alias ll="ls -lha --color=auto"

# Set GOPATH to hidden directory
export GOPATH="$HOME/.go"

# Append go binaries to the PATH
export PATH="$PATH:$HOME/.go/bin"
