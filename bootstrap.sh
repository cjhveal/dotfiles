#!/usr/bin/env bash

command_exists() {
  hash "$1" 2>/dev/null
}

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if ! command_exists brew; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew tap Homebrew/bundle
brew bundle -v --file="brew/.Brewfile"

if ! command_exists stow; then
  brew install stow
fi

stow --no-folding brew
stow --no-folding zsh
stow --no-folding vim
stow --no-folding zk

pip3 install neovim

echo "*** changing default shell to zsh ***"
if [ -f /usr/local/bin/zsh ]; then
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
  chsh -s /usr/local/bin/zsh
else
  chsh -s /bin/zsh
fi

echo "*** running mac os setup script ***"
./macos.sh
