#!/bin/bash

# Reset colors
tput sgr0

# Color configuration
reset=$(tput sgr0)
bold=$(tput bold)
blue=$(tput setaf 4)

# Get git branch name
function branch {
    if [[ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == "0" ]]
    then
        branch_name=$(
            git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo ""
        )

        if [[ -n $branch_name ]]
        then
            printf "[$branch_name]"
        else
            return
        fi       
    fi
}

PS1="\[$bold\]\u\[$blue\] > \[$reset\]"
PS1+="\[$bold\]\h\[$blue\] > \[$reset\]"
PS1+="\[$bold\]\w\[$reset\] "
PS1+="\[$bold\]\[$blue\]\$(branch)\[$reset\]"
PS1+="\n"
PS1+="\$ "

export PS1