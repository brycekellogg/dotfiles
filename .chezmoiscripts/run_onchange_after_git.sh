#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR

# TODO: install latest git
# add-apt-repository ppa:git-core/ppa
# apt update
# apt install git

if [ "$DOTFILES_OSID" == "linux-ubuntu" ]     || \
   [ "$DOTFILES_OSID" == "linux-ubuntu-wsl" ] || \
   [ "$DOTFILES_OSID" == "linux-fedora" ]; then


    # Check required tools
    command -v curl > /dev/null
    command -v tar  > /dev/null

    LAZYGIT_TAR_DIR=$(mktemp -d)
    LAZYGIT_URL="https://github.com/jesseduffield/lazygit/releases/download/v0.42.0/lazygit_0.42.0_Linux_32-bit.tar.gz"
    LAZYGIT_BIN_DEST="$HOME/.local/bin/"
    LAZYGIT_MAN_DEST="$HOME/.local/share/man/man1/"

    mkdir -p "$LAZYGIT_BIN_DEST"


    curl -sL "$LAZYGIT_URL" | tar -xz -C "$LAZYGIT_TAR_DIR"
    cp "$LAZYGIT_TAR_DIR/lazygit" "$LAZYGIT_BIN_DEST"

    rm -rf "$LAZYGIT_TAR_DIR"
fi

# make sure it installed correctly
export PATH=$PATH:"$HOME/.local/bin/"
command -v git
command -v lazygit
