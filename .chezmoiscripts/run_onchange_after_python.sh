#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


# Section for installing on Fedora
if [ "$CHEZMOI_OSID" == "linux-fedora" ]; then
    sudo dnf install bpython  # Use distro version
fi


# Section for installing on macOS
if [ "$CHEZMOI_OSID" == "darwin" ]; then
    command -v brew    # Check required tools
    brew install bpython  # Use homebrew version
fi

command -v bpython # make sure it installed correctly



