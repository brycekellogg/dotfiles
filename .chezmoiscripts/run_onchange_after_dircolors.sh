#!/bin/bash
# vim: syntax=bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Fedora
if [ "$DOTFILES_OSID" == "linux-fedora" ]; then
    sudo dnf install coreutils  # Use distro version
fi


# Section for installing on macOS
# if [ "$DOTFILES_OSID" == "darwin" ]; then
    # do nothing
# fi
