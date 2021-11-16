#!/usr/bin/env bash

#run commands manually. still not automated.
rm ~/.bashrc
ln -s ~/configfiles/bashrc ~/.bashrc

ln -s ~/configfiles/init.vim /u/home/wima/fchrstou/configfiles/init.vim
ln -s ~/configfiles/lua /u/home/wima/fchrstou/configfiles/lua

touch ~/.scripts/bashrc_machine_specific.sh

#install nvim
wget https://github.com/neovim/neovim/releases/download/v0.5.1/nvim-linux64.tar.gz
#add bin to path:
PATH=$PATH:/u/home/wima/fchrstou/Downloads/Apps/neovim/nightly-dev/nvim-linux64/bin

#for packer.nvim install
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

