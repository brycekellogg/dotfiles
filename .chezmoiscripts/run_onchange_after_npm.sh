#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Ubuntu
if [ "$DOTFILES_OSID" == "linux-ubuntu" ] || [ "$DOTFILES_OSID" == "linux-ubuntu-wsl" ]; then
    sudo apt-get install -y npm  # Use distro version
fi
