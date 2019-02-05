#!/bin/bash

# setup.sh実行している1つ上のPATH取得
setupdir=$(cd $(dirname $0)/.. && pwd)

# シンボリックリンクファイル
fdot='
vimrc
zshrc
tmux.conf
'

ddot='
vim
zsh
tmux
'

####################################
#
# Dotfiles Setup
#
####################################
echo "dotfilesのセットアップを開始してもいいですか？[Y/n]:"
read ANSWER

## y or nを判定
case `echo $ANSWER | tr y Y` in
  Y )
    echo "===> dotfilesの処理を開始します。"

    # ファイルを設置
    for i in ${fdot[@]}; do
      if [ ! -e ${HOME}/.${i} ]; then
        echo "==> ${i}のシンボリックリンクを作成します。"
        echo "${setupdir}/.${i} => ${HOME}/.${i}"
        ln -s ${setupdir}/.${i} $HOME/.${i}
      else
        echo "==> すでに${i}のシンボリックリンクが作成されているためスキップします。"
      fi
    done
    # ディレクトリを設置
    for j in ${ddot[@]}; do
      if [ ! -e ${HOME}/.${j} ]; then
        echo "==> ${j}のシンボリックリンクを作成します。"
        echo "${setupdir}/.${j} => ${HOME}/.${j}"
          ln -s ${setupdir}/.${j} $HOME/.${j}
      else
        echo "==> すでに${j}のシンボリックリンクが作成されているためスキップします。"
      fi
    done
  ;;
  * )
    echo "==> dotfilesのセットアップを終了します。"
  ;;
esac
