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

    FD_TAR_DIR=$(mktemp -d)
    FD_URL="https://github.com/sharkdp/fd/releases/download/v9.0.0/fd-v9.0.0-x86_64-unknown-linux-gnu.tar.gz"
    FD_BIN_DEST="$HOME/.local/bin/"
    FD_MAN_DEST="$HOME/.local/share/man/man1/"

    mkdir -p "$FD_BIN_DEST"
    mkdir -p "$FD_MAN_DEST"

    curl -sL "$FD_URL" | tar -xz -C "$FD_TAR_DIR" --strip-components=1
    cp "$FD_TAR_DIR/fd" "$FD_BIN_DEST"
    cp "$FD_TAR_DIR/fd.1" "$FD_MAN_DEST"

    rm -rf "$FD_TAR_DIR"
fi

# Section for installing on macOS
if [ "$DOTFILES_OSID" == "darwin" ]; then
    command -v brew    # Check required tools
    brew install fd  # Use homebrew version
fi

# make sure it installed correctly
export PATH=$PATH:"$HOME/.local/bin/"
command -v fd
