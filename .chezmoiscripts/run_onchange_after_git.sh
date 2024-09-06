#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR

# TODO: install latest git
if [[ "${DOTFILES_OSID}" == "linux-ubuntu"     ]] || \
   [[ "${DOTFILES_OSID}" == "linux-ubuntu-wsl" ]]; then

    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install git
fi

if [ "${DOTFILES_OSID}" == "linux-fedora" ]; then
    sudo dnf -y install git
fi

# make sure it installed correctly
command -v git
