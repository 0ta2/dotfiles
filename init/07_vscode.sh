#!/bin/bash

pkglist=(
  vscodevim.vim
  vscode-language-pack-ja
  golang.Go
)

for i in "${pkglist[@]}"; do
  code --install-extension --force "${i}"
done

# キーの押しっぱなしで移動できるようにする
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
