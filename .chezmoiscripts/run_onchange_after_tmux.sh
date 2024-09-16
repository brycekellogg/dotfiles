#!/bin/bash
# vim: ft=bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Fedora
if [ "$DOTFILES_OSID" == "linux-fedora" ]; then
    sudo dnf -y install tmux  # Use distro version
fi

# Section for installing on Ubuntu
if [ "$DOTFILES_OSID" == "linux-ubuntu" ] || [ "$DOTFILES_OSID" == "linux-ubuntu-wsl" ]; then

    TMUX_BUILD_DIR=$(mktemp -d)
    TMUX_DEST_DIR="$HOME/.local/"
    TMUX_URL="https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz"

    # Required to build
    sudo apt-get -y install libevent-dev
    
    curl -sL "$TMUX_URL" | tar -xz -C "$TMUX_BUILD_DIR" --strip-components=1
    env -C "$TMUX_BUILD_DIR/" ./configure --prefix="$TMUX_DEST_DIR"
    make -C "$TMUX_BUILD_DIR/"
    make -C "$TMUX_BUILD_DIR/" install
    

    rm -rf "$TMUX_BUILD_DIR"
fi

# Section for installing on macOS
if [ "$DOTFILES_OSID" == "darwin" ]; then
    command -v brew    # Check required tools
    brew install tmux  # use homebrew version
fi

# make it installed correctly
export PATH=$PATH:"$HOME/.local/bin/"
command -v tmux
