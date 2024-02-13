#!/bin/bash
# vim: ft=bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Fedora
if [ "$DOTFILES_OSID" == "linux-fedora" ]; then
    sudo dnf -y install alacritty  # Use distro version
fi

# Section for installing on Ubuntu
if [ "$DOTFILES_OSID" == "linux-ubuntu" ]; then
    sudo add-apt-repository -y ppa:aslatter/ppa
    sudo apt-get -y install alacritty  # Use distro version
fi


# Section for installing on macOS
if [ "$DOTFILES_OSID" == "darwin" ]; then
    command -v brew     # required to install
    command -v xattr    # required to remove developer warning
    brew install alacritty  # use homebrew version
    xattr -rd com.apple.quarantine /Applications/Alacritty.app/  # remove developer warning
fi
