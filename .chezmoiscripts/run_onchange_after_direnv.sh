#!/bin/bash
# vim: ft=bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR

# Section for installing on Fedora or Ubuntu or Ubuntu WSL
if [ "$DOTFILES_OSID" == "linux-fedora" ] ||
   [ "$DOTFILES_OSID" == "linux-ubuntu" ] ||
   [ "$DOTFILES_OSID" == "linux-ubuntu-wsl" ]; then
    DIRENV_DEST="$HOME/.local/bin/"
    DIRENV_URL="https://github.com/direnv/direnv/releases/download/v2.33.0/direnv.linux-amd64"
    mkdir -p "$DIRENV_DEST"
    curl -fsL $DIRENV_URL -o "$DIRENV_DEST/direnv"
    chmod a+x "$DIRENV_DEST/direnv"
fi


# Section for installing on macOS
if [ "$DOTFILES_OSID" == "darwin" ]; then
    : # ???
fi

# make sure it installed correctly
export PATH=$PATH:"$HOME/.local/bin/"
command -v direnv
