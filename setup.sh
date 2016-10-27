#!/bin/bash

dotfiles_logo='
    | |     | |  / _(_) |           
  __| | ___ | |_| |_ _| | ___  ___  
 / _` |/ _ \| __|  _| | |/ _ \/ __| 
| (_| | (_) | |_| | | | |  __/\__ \ 
 \__,_|\___/ \__|_| |_|_|\___||___/ 
====================================
1. Download Repository 
2. Symlinking dot files to your home directory
Copyright (c) 2016 ghfdjk
Licensed under the MIT license.
'

# setup.sh実行しているPATH取得
setupdir=$(cd $(dirname $0) && pwd)

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

# logoを表示させる
echo "${dotfiles_logo}"

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
       echo "===> ${i}のシンボリックリンクを作成します。"
       echo "===> ${setupdir}/.${i} =>${HOME}/.${i}"
       ln -s ${setupdir}/.${i} $HOME/.${i}
     else
       echo "===> すでに${i}のシンボリックリンクが作成されているためスキップします。"
     fi
   done

   # ディレクトリを設置
   for j in ${ddot[@]}; do
     if [ ! -e ${HOME}/.${j} ]; then
       echo "===> ${j}のシンボリックリンクを作成します。"
       echo "===> ${setupdir}/.${j} =>${HOME}/.${j}"
         ln -s ${setupdir}/.${j} $HOME/.${j}
     else
       echo "===> すでに${j}のシンボリックリンクが作成されているためスキップします。"
     fi
   done
  ;;
  * )
   echo "===> dotfilesのセットアップを終了します。"
  ;;
esac

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


####################################
#
# brw setup
#
####################################
# brewでインストールするものリスト
brewinstall=(
  zsh-completions
  zsh
  vim
  tmux
  git
  wget
  go
  reattach-to-user-namespace
  rbenv
  ruby-build
  coreutils
  python
  ansible
  tree
  packer
  ssh-copy-id
  pyenv
)

# オプション付きでインストールしようとすると空白ができてしまうため、セパレータを変更
IFS=$'\n'

# xcode-selectがインストールされているか判定
if [ ! -e /usr/bin/xcode-select ]; then
  echo "==> xcode-selectインストール"
  xcode-select --install
  exit 0
else
  echo "==> xcode-selectは、インストールされています。"
fi

# Homebrewをインストール
if  - e-  /usr/local/bin/brew ]; then
  echo "===> Homebrew Install"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "==> brew doctorを実行します。"
  brew doctor
  exit 0
else
  echo "===> すでにHomebrewはインストールされています。"
  # brew doctorを再度実行するか
  echo "===> brew doctorを実行しますか？[Y/n]:"
  read ANSWER

  # y or nを判定
  case `echo $ANSWER | tr y Y` in
    Y )
      echo "===> brew doctorを実行します。"
      brew doctor
      ;;
    * )
      echo "===> brew doctorを実行しませんでした。"
      ;;
  esac
fi

# brew installを実行
for install in ${brewinstall[@]}; do
  if  ! `brew list ${install} >/dev/null 2>&1`; then
    echo "===> ${install}をインストールします。"
    brew install ${install}
  else
    echo "===>${install}は、すでにインストールされています。"
  fi
done
