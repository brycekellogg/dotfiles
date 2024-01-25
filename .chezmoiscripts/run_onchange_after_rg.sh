#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Fedora
if [ "$DOTFILES_OSID" == "linux-fedora" ]; then
    sudo dnf install ripgrep  # Use distro version
fi

# Section for installing on Ubuntu
if [ "$DOTFILES_OSID" == "linux-ubuntu" ] || [ "$DOTFILES_OSID" == "linux-ubuntu-wsl" ]; then
    sudo apt install ripgrep  # Use distro version
fi

# Section for installing on macOS
if [ "$DOTFILES_OSID" == "darwin" ]; then
    command -v brew    # Check required tools
    brew install ripgrep  # Use homebrew version
fi

command -v rg # make sure it installed correctly



