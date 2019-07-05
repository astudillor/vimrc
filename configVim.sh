#!/bin/bash
mkdir -p ~/.vim
mkdir -p ~/.vim/undodir
git clone -b vundle_new https://github.com/astudillor/vimrc.git ~/.vim/vimrc
ln -s ~/.vim/vimrc/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
