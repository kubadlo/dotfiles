#!/bin/bash

# Load the shell dotfiles
source $HOME/.bash_prompt
source $HOME/.bash_aliases

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Make vim the default editor
export EDITOR="vim"

# Ignore duplicate commands in the history
export HISTCONTROL=ignoredups

# Java installation path
if [[ $(uname) == "Darwin" ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
else
    export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:bin/javac::")
fi

# Configure PATH
CARGO_BIN=$HOME/.cargo/bin
LOCAL_BIN=$HOME/.local/bin

export PATH="$LOCAL_BIN:$CARGO_BIN:$PATH"