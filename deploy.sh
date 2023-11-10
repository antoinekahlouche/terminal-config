#!/bin/bash

# nvim
rm -rf ~/.config/nvim
cp -Rf ./nvim/ ~/.config/nvim/

# zsh
cp -f .zshrc ~/.zshrc

# alacritty
cp -f alacritty.yml ~/.config/alacritty/alacritty.yml
