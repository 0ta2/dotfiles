#!/bin/bash
####################################
#
# brew setup
#
####################################
# brewでインストールするものリスト
brew_package=(
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
  fzf
  ripgrep
  mas
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
if [ ! -e /usr/local/bin/brew ]; then
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
for brew_install in ${brew_package[@]}; do
  if [ `brew list ${brew_install} >/dev/null 2>&1` ]; then
    echo "===> ${brew_install}をインストールします。"
    brew install ${brew_install}
  else
    echo "===>${brew_install}は、すでにインストールされています。"
  fi
done
