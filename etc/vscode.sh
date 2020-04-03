#!/bin/bash

pkglist=(
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
    yzhang.markdown-all-in-one
    felixfbecker.php-intellisense
    donjayamanne.githistory
    bbenoist.vagrant
    coolbear.systemd-unit-file
    robertrossmann.remedy
    material-icon-theme
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done

# キーの押しっぱなしで移動できるようにする
 defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
 defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
