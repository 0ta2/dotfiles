#!/bin/bash

pkglist=(
    christian-kohler.path-intellisense
    CoenraadS.bracket-pair-colorizer-2
    esbenp.prettier-vscod e
    formulahendry.docker-explorer
    hangxingliu.vscode-nginx-conf-hint
    jebbs.plantuml
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
    donjayamanne.githistory
    bbenoist.vagrant
    coolbear.systemd-unit-file
    robertrossmann.remedy
    streetsidesoftware.code-spell-checker
    shuworks.vscode-table-formatter
    PKief.material-icon-theme
    bmewburn.vscode-intelephense-client
    felixfbecker.php-debug
    aaron-bond.better-comments                  # コメントの表示
    Gruntfuggly.todo-tree                       # コード内のTODOの表示
    onecentlin.laravel5-snippets                # Laravel snippets
    onecentlin.laravel-blade                    # Laravel blade snippets
    ryannaddy.laravel-artisan                   # Laravel Artisan command
    codingyu.laravel-goto-view                  # Laravel blade
    amiralizadeh9480.laravel-extra-intellisense # Laravel autocomplete
    GitHub.github-vscode-theme                  # Theme
    alefragnani.Bookmarks                       # Bookmarks
    eamodio.gitlens                             # Git強化
    denoland.vscode-deno                        # Deno
    Dart-Code.flutter
)

for i in "${pkglist[@]}"; do
  code --install-extension "${i}"
done

# キーの押しっぱなしで移動できるようにする
 defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
 defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
