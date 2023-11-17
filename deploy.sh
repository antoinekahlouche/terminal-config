#!/bin/bash

# alacritty
cp -f alacritty.yml ~/.config/alacritty/alacritty.yml

# nvim
rm -rf ~/.config/nvim
cp -Rf ./nvim/ ~/.config/nvim/

# tmux
cp -f .tmux.conf ~/.tmux.conf

# zsh
cp -f .zshrc ~/.zshrc
