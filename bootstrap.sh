#!/usr/bin/env bash

command_exists() {
  hash "$1" 2>/dev/null
}

if !command_exists brew; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap Homebrew/bundle
brew bundle -v --file="brew/.Brewfile"

if !command_exists stow; then
  brew install stow
fi


