# Load Brew environemnt
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Cargo and Rust toolchain
eval "$(. $HOME/.cargo/env)"

# Load Node.js version manager
eval "$(nodenv init - zsh)"

# Append JetBrains IDEs starting scripts to the PATH
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
