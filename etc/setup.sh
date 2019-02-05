#!/bin/bash

dotfiles_logo='
    | |     | |  / _(_) |
  __| | ___ | |_| |_ _| | ___  __
 / _` |/ _ \| __|  _| | |/ _ \/ __|
| (_| | (_) | |_| | | | |  __/\__ \ 
 \__,_|\___/ \__|_| |_|_|\___||___/
====================================
1. Download Repository
2. Symlinking dot files to your home directory
Copyright (c) 2016 ghfdjk
Licensed under the MIT license.
'
# logoを表示させる
echo "${dotfiles_logo}"

# setup.sh実行しているPATH取得
setupdir=$(cd $(dirname $0) && pwd)

# 実行するshell
setup_shell='
symlink.sh
brew.sh
git.sh
tpm.sh
vim-plug.sh
zplug.sh
'

#go.sh

for exe_shell in ${setup_shell[@]}; do
  echo "===> ${exe_shell}を実行します"
  ${setupdir}/${exe_shell}
done
