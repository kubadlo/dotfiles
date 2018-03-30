#!/bin/bash

# Configure git globals
function git_cofig {
    # Git configuration
    cp ./git/config.git  ~/.gitconfig
    cp ./git/ignore.git  ~/.gitignore

    # Set credential helper on macOS
    if [[ $(uname) == "Darwin" ]]; then
        echo "[credential]" >> ~/.gitconfig;
        echo "    helper = osxkeychain" >> ~/.gitconfig;
        echo >> ~/.gitconfig;
    fi
}

function git_user {
    # Configure user name and email
    read -p "What is your user name? " user;
    read -p "What is your email? " email;

    echo "[user]" >> ~/.gitconfig;
    echo "    name  =" $user >> ~/.gitconfig;
    echo "    email =" $email >> ~/.gitconfig;
    echo >> ~/.gitconfig;
}

# Bash related files
cp ./bash/config.sh  ~/.bashrc
cp ./bash/profile.sh ~/.bash_profile
cp ./bash/prompt.sh  ~/.bash_prompt
cp ./bash/aliases.sh ~/.bash_aliases
cp ./bash/input.sh   ~/.inputrc

# Binaries
mkdir -p ~/.local/bin
cp ./bin/crypto ~/.local/bin/crypto

# Vim configuration
cp ./vim/config.vim  ~/.vimrc

# Check for git configuration file
if [[ -f $HOME/.gitconfig ]]; then
    read -p "Git is already configured. Do you wish to override it? [Y/n] " git_file
    case $git_file in
        ""|y|Y*)
            git_cofig;
            git_user;
            ;;
        *)
            echo "Git details skipped.";
            ;;  
    esac
else
    git_config;

    read -p "Do you wish to configure git user/email? [Y/n] " git_config
    case $git_config in
        ""|y|Y*)
            git_user;
            ;;
        *)
            echo "Git details skipped.";
            ;;  
    esac
fi

printf "\n[OK] Configuration files were successfully installed.\n"