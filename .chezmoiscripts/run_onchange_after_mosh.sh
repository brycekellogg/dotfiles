#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR

# Install build dependencies
if [ "$DOTFILES_OSID" == "linux-ubuntu" ] ||
   [ "$DOTFILES_OSID" == "linux-ubuntu-wsl" ]; then

    sudo apt-get install -y build-essential \
                            protobuf-compiler \
                            libprotobuf-dev \
                            pkg-config \
                            libutempter-dev \
                            zlib1g-dev \
                            libncurses5-dev \
                            libssl-dev
fi

if [ "$DOTFILES_OSID" == "linux-fedora" ]; then
    sudo dnf -y install make \
                        automake \
                        gcc \
                        gcc-c++
fi

# Section for installing on Fedora or Ubuntu or Ubuntu WSL
if [ "$DOTFILES_OSID" == "linux-fedora" ] ||
   [ "$DOTFILES_OSID" == "linux-ubuntu" ] ||
   [ "$DOTFILES_OSID" == "linux-ubuntu-wsl" ]; then

    # Check required tools
    command -v curl > /dev/null
    command -v tar  > /dev/null


    MOSH_BUILD_DIR=$(mktemp -d)
    MOSH_DEST_DIR="$HOME/.local/"
    MOSH_URL="https://github.com/mobile-shell/mosh/releases/download/mosh-1.4.0/mosh-1.4.0.tar.gz"

    curl -sL "$MOSH_URL" | tar -xz -C "$MOSH_BUILD_DIR" --strip-components=1

    env -C "$MOSH_BUILD_DIR/" ./configure --prefix="$MOSH_DEST_DIR"
    make -C "$MOSH_BUILD_DIR/"
    make -C "$MOSH_BUILD_DIR/" install

    rm -rf "$MOSH_TAR_DIR"
fi


# make sure it installed correctly
export PATH=$PATH:"$HOME/.local/bin/"
command -v mosh
