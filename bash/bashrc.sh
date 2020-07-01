#!/bin/bash

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Load the shell dotfiles
source $HOME/.bash_prompt
source $HOME/.bash_aliases

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Auto "cd" when entering just a path
shopt -s autocd

# Line wrap on window resize
shopt -s checkwinsize

# Disable completion when the input buffer is empty
shopt -s no_empty_cmd_completion

# Enable history appending instead of overwriting when exiting
shopt -s histappend

# Make vim the default editor
export EDITOR="vim"

# Ignore duplicate commands in the history
export HISTCONTROL=ignoredups

# Java installation path
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:bin/javac::")

# Configure PATH
CARGO_BIN=$HOME/.cargo/bin
LOCAL_BIN=$HOME/.local/bin

export PATH="$LOCAL_BIN:$CARGO_BIN:$PATH"