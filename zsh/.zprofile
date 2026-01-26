# Homebrew package manager
eval "$(/opt/homebrew/bin/brew shellenv)"

# Node.js version manager
eval "$(nodenv init - zsh)"

CARGO_BIN="$HOME/.cargo/bin"
LOCAL_BIN="$HOME/.local/bin"
JETBRAINS="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

export PATH="$PATH:$CARGO_BIN:$LOCAL_BIN:$JETBRAINS"
