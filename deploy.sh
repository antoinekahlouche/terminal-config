#!/bin/bash

# Alacritty
cp -f alacritty.yml ~/.config/alacritty/alacritty.yml

# Nvim
rm -rf ~/.config/nvim
cp -Rf ./nvim/ ~/.config/nvim/

# Tmux
cp -f .tmux.conf ~/.tmux.conf

# Zsh
cp -f .zshrc ~/.zshrc

