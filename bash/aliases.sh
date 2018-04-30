#!/bin/bash

# Check for ls version
if [[ $(uname) == "Darwin" ]]; then
    ls_color="-G"
else
    ls_color="--color"
fi

# List files and directories
alias ls="ls -lh ${ls_color}"
alias ll="ls -lhA ${ls_color}"

# Enable colored `grep` output
alias grep="grep --color=auto"

# Enable aliases to be executed with sudo
alias sudo="sudo "

# Print current week number
alias week="date +%V"

# IP addresses
alias localip="ipconfig getifaddr en0"
alias externalip="dig +short myip.opendns.com @resolver1.opendns.com"

# Show sizes for all files and folders in current location
alias howbig="du -sch .[!.]* * | sort -k 2"

# Change text to lowercase
alias trun='tr [A-Z] [a-z]'

# Reset Launchpad layout on macOS
if [[ $(uname) == "Darwin" ]]; then
    alias rlaunch='defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock'
fi