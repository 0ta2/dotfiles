#!/bin/bash
####################################
#
# zplug setup
#
####################################

echo "===> zplugをインストールします"
if [ ! -d "$HOME/.zplug" ]; then
  echo "curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh"
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
else
  echo "===> すでにzplugがインストールされています"
fi
