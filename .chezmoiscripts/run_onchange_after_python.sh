#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Fedora
if [ "$DOTFILES_OSID" == "linux-fedora" ]; then
    sudo dnf install -y python3 python3-pip python3-virtualenv bpython
    pip3 install neovim
fi


# Section for installing on Fedora
if [ "$DOTFILES_OSID" == "linux-ubuntu-wsl" ] || [ "$DOTFILES_OSID" == "linux-ubuntu" ]; then
    sudo apt-get install -y python3 python3-pip python3-venv bpython
    pip3 install neovim
fi



# Section for installing on macOS
if [ "$DOTFILES_OSID" == "darwin" ]; then
    command -v brew    # Check required tools
    brew install python3 bpython
    pip3 install --break-system-packages neovim
fi

# make sure everything installed correctly
command -v python3
command -v pip3
command -v bpython

