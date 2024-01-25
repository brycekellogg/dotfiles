#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Fedora
if [ "$DOTFILES_OSID" == "linux-fedora" ]; then
    command -v curl    # Check required tools
    command -v tar     # Check required tools
    EZA_DEST="$HOME/.local/bin/"
    EZA_URL="https://github.com/eza-community/eza/releases/download/v0.17.2/eza_x86_64-unknown-linux-gnu.tar.gz"
    curl -L "$EZA_URL" | tar -xz -C "$EZA_DEST"
fi

# Section for installing on Ubuntu
if [ "$DOTFILES_OSID" == "linux-ubuntu" ] || [ "$DOTFILES_OSID" == "linux-ubuntu-wsl" ]; then
    command -v curl    # Check required tools
    command -v tar     # Check required tools
    EZA_DEST="$HOME/.local/bin/"
    EZA_URL="https://github.com/eza-community/eza/releases/download/v0.17.2/eza_x86_64-unknown-linux-gnu.tar.gz"
    curl -sL "$EZA_URL" | tar -xz -C "$EZA_DEST"
fi


# Section for installing on macOS
if [ "$DOTFILES_OSID" == "darwin" ]; then
    command -v brew    # Check required tools
    brew install eza  # Use homebrew version
fi

command -v eza # make sure it installed correctly


