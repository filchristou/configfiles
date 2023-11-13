#!/usr/bin/env bash

#run commands manually. still not automated.
rm ~/.bashrc
ln -s ~/configfiles/bashrc ~/.bashrc
ln -s ~/configfiles/nvim ~/.config/nvim

touch ~/.scripts/bashrc_machine_specific.sh

# install juliaup
curl -fsSL https://install.julialang.org | sh

#install nvim
wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
mkpath -p ~/Downloads/Apps/neovim
rm -rf ~/Downloads/Appls/neovim/*
mv nvim-linux64.tar.gz ~/Downloads/Apps/neovim
tar -xf ~/Downloads/Apps/neovim/nvim-linux64.tar.gz -C ~/Downloads/Apps/neovim/

#for packer.nvim install
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

