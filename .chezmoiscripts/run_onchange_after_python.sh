#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Fedora
if [ "$CHEZMOI_OSID" == "linux-fedora" ]; then
    sudo dnf install -y python3 python3-pip python3-virtualenv bpython
fi


# Section for installing on Fedora
if [ "$CHEZMOI_OSID" == "linux-ubuntu-wsl" ] || [ "$CHEZMOI_OSID" == "linux-ubuntu" ]; then
    sudo apt-get install python3 python3-pip python3-venv bpython
fi



# Section for installing on macOS
if [ "$CHEZMOI_OSID" == "darwin" ]; then
    command -v brew    # Check required tools
    brew install python3 bpython
fi

# make sure everything installed correctly
command -v python3
command -v pip3
command -v bpython

# Use pip to install packages
pip3 install neovim


