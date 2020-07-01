#!/bin/bash

# List files and directories
alias ls="ls -lh --color --group-directories-first"
alias ll="ls -lhA --color --group-directories-first"

# Enable colored `grep` output
alias grep="grep --color=auto"

# Enable aliases to be executed with sudo
alias sudo="sudo "

# Print current week number
alias week="date +%V"

# Show sizes for all files and folders in current location
alias howbig="du -sch .[!.]* * | sort -k 2"

# Change text to lowercase
alias trun='tr [A-Z] [a-z]'