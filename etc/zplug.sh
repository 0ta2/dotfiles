#!/bin/bash
####################################
#
# zplug setup
#
####################################

echo "===> zplugをインストールします"
if [ ! -d "$HOME/.zplug" ]; then
  echo "===> curl -sL zplug.sh/installer | zsh"
  curl -sL zplug.sh/installer | zsh
else
  echo "===> すでにzplugがインストールされています"
fi
