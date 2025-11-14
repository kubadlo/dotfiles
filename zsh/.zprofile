# Load Brew environemnt
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Node.js version manager
eval "$(nodenv init - zsh)"

# Load Cargo and Rust toolchain
source $HOME/.cargo/env

# Append JetBrains IDEs starting scripts to the PATH
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
