# Homebrew package manager
eval "$(/opt/homebrew/bin/brew shellenv)"

LOCAL_BIN="$HOME/.local/bin"
CARGO_BIN="$HOME/.cargo/bin"

# Extend PATH with local bin folders
export PATH="$LOCAL_BIN:$CARGO_BIN:$PATH"

# Source local shell completions
export FPATH="$HOME/.zsh/completions:$FPATH"
