#!/bin/bash

pkglist=(
    arcticicestudio.nord-visual-studio-code
    christian-kohler.path-intellisense
    CoenraadS.bracket-pair-colorizer-2
    esbenp.prettier-vscode
    formulahendry.docker-explorer
    hangxingliu.vscode-nginx-conf-hint
    jebbs.plantuml
    kken0201.vscode-esa
    mrmlnc.vscode-apache
    ms-azuretools.vscode-docker
    MS-CEINTL.vscode-language-pack-ja
    ms-python.python
    rogalmic.bash-debug
    shardulm94.trailing-spaces
    vscodevim.vim
    vscoss.vscode-ansible
    waderyan.gitblame
    wayou.vscode-icons-mac
    yzhang.markdown-all-in-one
    felixfbecker.php-intellisense
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done