#!/bin/bash
# vim: ft=bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Only needed on macOS
if [ "$DOTFILES_OSID" == "darwin" ]; then
    command -v brew     # required to install
    brew install coreutils
fi
