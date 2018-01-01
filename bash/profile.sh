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

# Save ruby gems in home folder instead of system
export GEM_HOME=$HOME/.gem

# Java installation path
if [[ $(uname) == "Darwin" ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
else
    export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:bin/javac::")
fi

# Configure PATH
CARGO_BIN=$HOME/.cargo/bin
LOCAL_BIN=$HOME/.local/bin
RGEMS_BIN=$HOME/.gem/bin
PORTS_BIN="/opt/local/bin:/opt/local/sbin"

export PATH="$LOCAL_BIN:$PORTS_BIN:$CARGO_BIN:$RGEMS_BIN:$PATH"