#!/bin/bash

rm -rf ~/.config/nvim
cp -Rf ./nvim/ ~/.config/nvim/

rm  ~/.zshrc
cp ./.zshrc ~/.zshrc 

rm  ~/.p10k.zsh
cp ./.p10k.zsh ~/.p10k.zsh
