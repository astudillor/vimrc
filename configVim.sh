#!/bin/bash
mkdir -p ~/.vim
git clone -b with_vundle https://github.com/astudillor/vimrc.git ~/.vim/vimrc
ln -s ~/.vim/vimrc/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
curl http://reinaldoastudillo.nl/vim_snippets/_.snippets >> ~/.vim/bundle/vim-snippets/snippets/_.snippets
