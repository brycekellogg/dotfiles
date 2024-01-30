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

    RG_TAR_DIR=$(mktemp -d)
    RG_URL="https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep-14.1.0-x86_64-unknown-linux-musl.tar.gz"
    RG_BIN_DEST="$HOME/.local/bin/"
    RG_MAN_DEST="$HOME/.local/share/man/man1/"

    mkdir -p "$RG_BIN_DEST"
    mkdir -p "$RG_MAN_DEST"

    curl -sL "$RG_URL" | tar -xz -C "$RG_TAR_DIR" --strip-components=1
    cp "$RG_TAR_DIR/rg" "$RG_BIN_DEST"
    cp "$RG_TAR_DIR/doc/rg.1" "$RG_MAN_DEST"
fi

# Section for installing on macOS
if [ "$DOTFILES_OSID" == "darwin" ]; then
    command -v brew    # Check required tools
    brew install ripgrep  # Use homebrew version
fi

# make sure it installed correctly
export PATH=$PATH:"$HOME/.local/bin/"
command -v rg
