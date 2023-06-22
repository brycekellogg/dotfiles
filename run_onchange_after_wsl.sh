#!/bin/bash
# vim: syntax=bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR

# The win32yank tool is only used in WSL version
# of linux; only install it if we're in WSL.
if [ "$CHEZMOI_OSID" == "linux-ubuntu-wsl" ]; then

    # Various operations in this script require root priviliges.
    # We cache them here so that we don't need to ask later.
    sudo echo "Win32yank: cache sudo credentials..."

    # Check that the required packages are installed
    echo "Win32yank: check for required tools..."
    command -v curl
    command -v unzip

    WINUSER=$(cmd.exe /c "echo %USERNAME%" 2>>/dev/null | tr -d '\r')
    WIN32YANK_URL="https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip"
    WIN32YANK_ZIP="/tmp/win32yank.zip"
    WIN32YANK_INSTALL="/mnt/c/Users/$WINUSER/wsl-bin/"

    echo "Win32yank: download & install..."
    mkdir -p $WIN32YANK_INSTALL
    curl -sLo $WIN32YANK_ZIP $WIN32YANK_URL
    sudo unzip -u $WIN32YANK_ZIP win32yank.exe -d $WIN32YANK_INSTALL
    sudo chmod a+x $WIN32YANK_INSTALL/win32yank.exe
    rm -rf $WIN32YANK_ZIP

fi
