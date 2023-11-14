#!/bin/bash
# vim: ft=bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Fedora
if [ "$CHEZMOI_OSID" == "linux-fedora" ]; then
    sudo dnf install alacritty  # Use distro version
fi

# Section for installing on Ubuntu
if [ "$CHEZMOI_OSID" == "linux-ubuntu" ]; then
    sudo add-apt-repository ppa:aslatter/ppa
    sudo apt install alacritty  # Use distro version
fi


# Section for installing on macOS
if [ "$CHEZMOI_OSID" == "darwin" ]; then
    command -v brew     # required to install
    command -v xattr    # required to remove developer warning
    brew install alacritty  # use homebrew version
    xattr -rd com.apple.quarantine /Applications/Alacritty.app/  # remove developer warning
fi
