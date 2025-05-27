# Getting Started

## Ubuntu
```
sudo apt-get install curl git
sudo sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b /usr/bin/
chezmoi init --apply brycekellogg
```

## Fedora
```
sudo sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b /usr/bin/
chezmoi init --apply brycekellogg
```

## macOS
The macOS setup requires [Homebrew](https://docs.brew.sh/) & Git to be installed prior to using Chezmoi. We install Git initially using
the "XCode Command Line Tools"; from there Homebrew & Chezmoi can be installed and the dotfiles initialized.

```shell
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=$PATH:/opt/homebrew/bin/
brew install chezmoi
chezmoi init --apply brycekellogg
```

# Chezmoi Operations
```
chezmoi edit --apply $FILE
chezmoi re-add
chezmoi diff
chezmoi chattr +template $FILE  # make an existing file a template
```

# Tmux Configuration

- <kbd>Alt</kbd><kbd>←</kbd> - Select pane to the left of current
- <kbd>Alt</kbd><kbd>→</kbd> - Select pane to the right of current
- <kbd>Alt</kbd><kbd>↑</kbd> - Select pane above current
- <kbd>Alt</kbd><kbd>↓</kbd> - Select pane below current
- <kbd>Alt</kbd><kbd>PgUp</kbd> - Select window (tab) to the left of current
- <kbd>Alt</kbd><kbd>PgDn</kbd> - Select window (tab) to the right of current
- <kbd>Alt</kbd><kbd>+</kbd> - Create a new window (tab) to the right of current
- <kbd>Alt</kbd><kbd>r</kbd> - Rename current window (tab)
- <kbd>Alt</kbd><kbd>z</kbd> - Toggle zoom for current pane
- <kbd>Alt</kbd><kbd>Shift</kbd><kbd>←</kbd> - Swap pane to the left
- <kbd>Alt</kbd><kbd>Shift</kbd><kbd>→</kbd> - Swap pane to the right
- <kbd>Alt</kbd><kbd>Shift</kbd><kbd>↑</kbd> - Swap pane up
- <kbd>Alt</kbd><kbd>Shift</kbd><kbd>↓</kbd> - Swap pane down
- <kbd>Alt</kbd><kbd>|</kbd> - Split pane vertically
- <kbd>Alt</kbd><kbd>-</kbd> - Split pane horizontally
- <kbd>Alt</kbd><kbd>Space</kbd> - Enter select mode
- <kbd>v</kbd> (in select mode) - Start visual selection
- <kbd>Esc</kbd> (in select mode) - Exit select mode
- <kbd>y</kbd> (in select mode) - Copy
- <kbd>Alt</kbd><kbd>v</kbd> - Paste

# Passwordless Sudo
```shell
echo "$USER ALL = (ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/nopasswd
```

# Debugging Neovim Highlight groups
https://vi.stackexchange.com/questions/39781/how-to-get-the-highlight-group-of-the-word-under-the-cursor-in-neovim-with-trees


# Profiling Fish
https://stackoverflow.com/questions/63290042/how-can-i-profile-the-fish-shell-init
