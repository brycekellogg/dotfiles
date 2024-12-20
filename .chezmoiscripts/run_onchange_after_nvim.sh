#!/bin/bash
# vim: syntax=bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# This is the section that manages installing
# nvim if we are in a linux based environment.
if [ "$DOTFILES_OSID" == "linux-ubuntu" ]     || \
   [ "$DOTFILES_OSID" == "linux-ubuntu-wsl" ] || \
   [ "$DOTFILES_OSID" == "linux-fedora" ]; then

    command -v curl
    command -v tar

    # Neovim version & various helper variables
    NVIM_VERSION="0.10.2"
    NVIM_TARFILE="nvim-linux64.tar.gz"
    NVIM_DIR="$(mktemp -d)"
    NVIM_URL="https://github.com/neovim/neovim/releases/download/v$NVIM_VERSION/$NVIM_TARFILE"
    NVIM_DEST="$HOME/.local/"

    # Download & install neovim
    curl -sLo $NVIM_DIR/${NVIM_TARFILE} $NVIM_URL            # Download nvim source
    tar -C $NVIM_DIR -xzf $NVIM_DIR/$NVIM_TARFILE            # Unpack the tarfile
    mkdir -p $NVIM_DEST/bin/                                 # Create destination directory
    mkdir -p $NVIM_DEST/lib/
    mkdir -p $NVIM_DEST/share/
    cp -rf $NVIM_DIR/nvim-linux64/bin/*   $NVIM_DEST/bin/    # Copy files to install dir
    cp -rf $NVIM_DIR/nvim-linux64/lib/*   $NVIM_DEST/lib/
    cp -rf $NVIM_DIR/nvim-linux64/share/* $NVIM_DEST/share/
    rm -rf $NVIM_DIR                                         # Cleanup
fi


# This is the section that manages
# installing nvim if we are in macos.
if [ "$DOTFILES_OSID" == "darwin" ]; then

    # Check required tools
    command -v curl   # required to download
    command -v xattr  # required to change tar attrtibutes
    command -v tar    # required to untar

    # Neovim version & various helper variables
    NVIM_VERSION="0.9.1"
    NVIM_TARFILE="nvim-macos.tar.gz"
    NVIM_DIR="$(mktemp -d)"
    NVIM_URL="https://github.com/neovim/neovim/releases/download/v$NVIM_VERSION/$NVIM_TARFILE"
    NVIM_DEST="$HOME/.local/"

    # Download & install neovim
    curl -sLo $NVIM_DIR/$NVIM_TARFILE $NVIM_URL               # Download nvim source
    xattr -c $NVIM_DIR/$NVIM_TARFILE                          # Avoid "unknown developer" warning
    tar -C $NVIM_DIR -xzf $NVIM_DIR/$NVIM_TARFILE             # Unpack the tarfile
    mkdir -p $NVIM_DEST/bin/                                  # Create destination directory
    mkdir -p $NVIM_DEST/lib/
    mkdir -p $NVIM_DEST/share/
    cp -rf $NVIM_DIR/nvim-macos/bin/*    $NVIM_DEST/bin/      # Copy files to install dir
    cp -rf $NVIM_DIR/nvim-macos/lib/*    $NVIM_DEST/lib/
    cp -rf $NVIM_DIR/nvim-macos/share/*  $NVIM_DEST/share/
    rm -rf $NVIM_DIR                                          # Cleanup
fi



# Clean, install, & update all Neovim plugins
$NVIM_DEST/bin/nvim --headless "+Lazy! sync" "+qall"

