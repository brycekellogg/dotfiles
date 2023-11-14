#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Fedora
if [ "$CHEZMOI_OSID" == "linux-fedora" ]; then
    sudo dnf install exa  # Use distro version
fi

# Section for installing on Ubuntu
if [ "$CHEZMOI_OSID" == "linux-ubuntu" ]; then
    sudo apt install exa  # Use distro version
fi


# Section for installing on macOS
if [ "$CHEZMOI_OSID" == "darwin" ]; then
    command -v brew    # Check required tools
    brew install exa  # Use homebrew version
fi

command -v exa # make sure it installed correctly


