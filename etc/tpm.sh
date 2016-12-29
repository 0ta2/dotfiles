#!/bin/bash
####################################
#
# tpm setup
#
####################################

echo "===> tpmをインストールします"
if [ ! -d "$HOME/.tmux/plugins" ]; then
  echo "===> mkdir $HOME/.tmux/plugins"
  mkdir "$HOME/.tmux/plugins"
else
  echo "===> すでにpluginディレクトリがあるのでスキップします"
fi
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "===> git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "===> すでにtpmがインストールされています"
fi
