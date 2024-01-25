#!/bin/bash
# vim: ft=bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Fedora
if [ "$CHEZMOI_OSID" == "linux-fedora" ]; then
    : # ???    
fi

# Section for installing on Ubuntu
if [ "$CHEZMOI_OSID" == "linux-ubuntu" ]; then
    sudo apt install direnv
fi


# Section for installing on macOS
if [ "$CHEZMOI_OSID" == "darwin" ]; then
    : # ???
fi

command -v direnv # make sure it installed correctly
