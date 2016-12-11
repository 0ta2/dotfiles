#!/bin/bash

####################################
#
# vim-plug setup
#
####################################
echo "===> vim-plugをインストールします"
if [ ! -e "$HOME/.vim/autoload/plug.vim" ]; then
  echo "===> curl -# -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  curl -# -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo "===> すでにplug.vimが存在します"
fi
