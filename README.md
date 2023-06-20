# Getting Started

## Ubuntu
```
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

# Passwordless Sudo
```shell
echo "$USER ALL = (ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/nopasswd
```
