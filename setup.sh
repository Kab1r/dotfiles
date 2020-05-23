#!/bin/sh

echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Installing programs"
brew install yadm fish starship tmux neovim node

$(brew --prefix yadm) clone https://dotfiles.kwatra.me
