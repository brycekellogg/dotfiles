#!/bin/bash
# vim: ft=bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR

# Section for installing on macOS
# if [ "$DOTFILES_OSID" == "darwin" ]; then
#     brew install direnv
# fi

# make sure it installed correctly
export PATH=$PATH:"$HOME/.local/bin/"
command -v direnv
