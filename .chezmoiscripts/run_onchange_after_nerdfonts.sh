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
if [ "$DOTFILES_OSID" == "linux-ubuntu-wsl"  ]; then

    USERNAME=$(powershell.exe -c 'echo $env:USERNAME' | tr -d '\r')
    DEJAVU_DEST="/mnt/c/Users/$USERNAME/AppData/Local/Microsoft/Windows/Fonts/"

    # Windows isn't allowing me to overwrite font files
    rm -rf "$DEJAVU_DEST/DejaVuSansMNerdFontMono*"

    mkdir -p "$DEJAVU_DEST"
    env -C "$DEJAVU_DEST" curl -fsLO $DEJAVU_URL_REGULAR
    env -C "$DEJAVU_DEST" curl -fsLO $DEJAVU_URL_BOLD
    env -C "$DEJAVU_DEST" curl -fsLO $DEJAVU_URL_ITALIC

    # Note: restart Windows to find font
fi

# Section for installing on Fedora or Ubuntu
if [ "$DOTFILES_OSID" == "linux-fedora" ] || [ "$DOTFILES_OSID" == "linux-ubuntu" ]; then

    DEJAVU_DEST="$HOME/.local/share/fonts/"

    mkdir -p $DEJAVU_DEST
    env -C $DEJAVU_DEST curl -fsLO $DEJAVU_URL_REGULAR
    env -C $DEJAVU_DEST curl -fsLO $DEJAVU_URL_BOLD
    env -C $DEJAVU_DEST curl -fsLO $DEJAVU_URL_ITALIC
    fc-cache -f
fi

# Section for installing on macOS
if [ "$DOTFILES_OSID" == "darwin" ]; then

    DEJAVU_DEST="$HOME/Library/fonts/"

    mkdir -p $DEJAVU_DEST
    cd $DEJAVU_DEST && curl -fsLO $DEJAVU_URL_REGULAR
    cd $DEJAVU_DEST && curl -fsLO $DEJAVU_URL_BOLD
    cd $DEJAVU_DEST && curl -fsLO $DEJAVU_URL_ITALIC
fi
