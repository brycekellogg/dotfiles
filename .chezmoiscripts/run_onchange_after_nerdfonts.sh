#!/bin/bash

# Set bash to exit on the first error & print an error
# message detailing which command produced the error.
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' ERR

# Source file URLs
DEJAVU_URL_REGULAR="https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DejaVuSansMono/Regular/DejaVuSansMNerdFontMono-Regular.ttf"
DEJAVU_URL_BOLD="https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DejaVuSansMono/Bold/DejaVuSansMNerdFontMono-Bold.ttf"
DEJAVU_URL_ITALIC="https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DejaVuSansMono/Italic/DejaVuSansMNerdFontMono-Oblique.ttf"

# Section for installing on WSL
if [ "$CHEZMOI_OSID" == "linux-ubuntu-wsl"  ]; then

    DEJAVU_DEST="/mnt/c/Users/$USER/AppData/Local/Microsoft/Windows/Fonts/"

    # Windows isn't allowing me to overwrite font files
    rm $DEJAVU_DEST/DejaVuSansMNerdFontMono*

    env -C $DEJAVU_DEST curl -fLO $DEJAVU_URL_REGULAR
    env -C $DEJAVU_DEST curl -fLO $DEJAVU_URL_BOLD
    env -C $DEJAVU_DEST curl -fLO $DEJAVU_URL_ITALIC

    # Note: restart Windows Terminal to find font
fi

# Section for installing on Fedora
if [ "$CHEZMOI_OSID" == "linux-fedora" ]; then

    DEJAVU_DEST="$HOME/.local/share/fonts/"

    mkdir -p $DEJAVU_DEST
    env -C $DEJAVU_DEST curl -fLO $DEJAVU_URL_REGULAR
    env -C $DEJAVU_DEST curl -fLO $DEJAVU_URL_BOLD
    env -C $DEJAVU_DEST curl -fLO $DEJAVU_URL_ITALIC
    fc-cache -f
fi

# Section for installing on macOS
if [ "$CHEZMOI_OSID" == "darwin" ]; then

    DEJAVU_DEST="$HOME/Library/fonts/"

    mkdir -p $DEJAVU_DEST
    cd $DEJAVU_DEST && curl -fLO $DEJAVU_URL_REGULAR
    cd $DEJAVU_DEST && curl -fLO $DEJAVU_URL_BOLD
    cd $DEJAVU_DEST && curl -fLO $DEJAVU_URL_ITALIC
fi
