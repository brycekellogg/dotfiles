#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR

# Section for installing on Fedora or Ubuntu or Ubuntu WSL
if [ "$DOTFILES_OSID" == "linux-fedora" ] ||
   [ "$DOTFILES_OSID" == "linux-ubuntu" ] ||
   [ "$DOTFILES_OSID" == "linux-ubuntu-wsl" ]; then

    # Check required tools
    command -v curl > /dev/null
    command -v tar  > /dev/null

    # Download & install
    EZA_DEST="$HOME/.local/bin/"
    EZA_URL="https://github.com/eza-community/eza/releases/download/v0.17.2/eza_x86_64-unknown-linux-gnu.tar.gz"
    mkdir -p "$EZA_DEST"
    curl -sL "$EZA_URL" | tar -xz -C "$EZA_DEST"
fi


# Section for installing on macOS
if [ "$DOTFILES_OSID" == "darwin" ]; then
    command -v brew    # Check required tools
    brew install eza  # Use homebrew version
fi

# make sure it installed correctly
export PATH=$PATH:"$HOME/.local/bin/"
command -v eza
