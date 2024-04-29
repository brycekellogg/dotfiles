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

    CTAG_TAR_DIR=$(mktemp -d)
    CTAG_URL="https://github.com/universal-ctags/ctags-nightly-build/releases/download/2024.04.21%2B81e15e5f0c279c7bd4cb543e9564ae734868eab3/uctags-2024.04.21-linux-x86_64.tar.bz2"
    CTAG_BIN_DEST="$HOME/.local/bin/"
    CTAG_MAN1_DEST="$HOME/.local/share/man/man1/"
    CTAG_MAN5_DEST="$HOME/.local/share/man/man5/"
    CTAG_MAN7_DEST="$HOME/.local/share/man/man7/"

    mkdir -p "$CTAG_BIN_DEST"
    mkdir -p "$CTAG_MAN1_DEST"
    mkdir -p "$CTAG_MAN5_DEST"
    mkdir -p "$CTAG_MAN7_DEST"

    curl -sL "$CTAG_URL" | tar -xj -C "$CTAG_TAR_DIR" --strip-components=1
    cp "$CTAG_TAR_DIR"/bin/* "$CTAG_BIN_DEST"
    cp "$CTAG_TAR_DIR"/man/man1/* "$CTAG_MAN1_DEST"
    cp "$CTAG_TAR_DIR"/man/man5/* "$CTAG_MAN5_DEST"
    cp "$CTAG_TAR_DIR"/man/man7/* "$CTAG_MAN7_DEST"

    rm -rf "$CTAG_TAR_DIR"
fi


