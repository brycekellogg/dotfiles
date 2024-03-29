#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR


command -v curl  # required for all OSIDs

# Section for installing on Fedora
if [ "$DOTFILES_OSID" == "linux-fedora" ]; then
    sudo dnf -y install fish  # Use distro version
fi

# Section for installing on Ubuntu
if [ "$DOTFILES_OSID" == "linux-ubuntu" ] || [ "$DOTFILES_OSID" == "linux-ubuntu-wsl" ]; then
    sudo add-apt-repository -y ppa:fish-shell/release-3
    sudo apt-get -y install fish  # Use distro version
fi


# Section for installing on macOS
if [ "$DOTFILES_OSID" == "darwin" ]; then
    command -v brew    # Check required tools
    brew install fish  # use homebrew version
fi

command -v fish # make it fish installed correctly

# Install Fisher plugin manager
FISHER_URL="https://git.io/fisher"
FISHER_SCRIPT="/tmp/fisher"
curl -sLo $FISHER_SCRIPT $FISHER_URL
fish -c "source $FISHER_SCRIPT && fisher install jorgebucaran/fisher"
rm -rf $FISHER_SCRIPT

# Install & update fish plugins
fish -c "fisher install brycekellogg/tide"
fish -c "fisher install edc/bass"
fish -c "fisher update"

