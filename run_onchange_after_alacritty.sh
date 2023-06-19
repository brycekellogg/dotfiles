#!/bin/bash
# vim: ft=bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Fedora
if [ "$CHEZMOI_OSID" == "linux-fedora" ]; then
    sudo dnf install alacritty  # Use distro version
fi


# Section for installing on macOS
if [ "$CHEZMOI_OSID" == "darwin" ]; then

    # Check required tools
    command -v curl     # required to download
    command -v hdiutil  # required to mount DMG
    command -v mkdir    # required to create dest dir
    command -v cp       # required to install files
    command -v rm       # required to clean up

    # Helper variables
    ALACRITTY_URL="https://github.com/alacritty/alacritty/releases/download/v0.12.1/Alacritty-v0.12.1.dmg"
    ALACRITTY_DMG="Alacritty.dmg"
    ALACRITTY_VOLUME="/Volumes/Alacritty"
    ALACRITTY_APP="$ALACRITTY_VOLUME/Alacritty.app"
    ALACRITTY_DEST="$HOME/Applications"

    # Download & install
    curl -sLo $ALACRITTY_DMG $ALACRITTY_URL  # download DMG file
    hdiutil attach $ALACRITTY_DMG            # mount disk image
    mkdir -p $ALACRITTY_DEST                 # create user specific app directory
    cp -R  $ALACRITTY_APP $ALACRITTY_DEST    # do the install (via cp)
    hdiutil detach $ALACRITTY_VOLUME         # unmount disk image
    rm -rf $ALACRITTY_DMG                    # clean up downloaded files
fi
