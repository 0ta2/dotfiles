#--------------
# zshenv
# ログインシェル/インタラクティブシェル/シェルスクリプトの場合に読み込まれる
#--------------
# 基本PATH設定
export PATH=/usr/local/bin:/usr/bin:$HOME/.zsh/bin:${PATH}

# dotfiles の PATHを環境変数に読み込ませる
export DOTFILES_PATH="${HOME}/.ghq/github.com/0ta2/dotfiles"

#---------------------------
# Python設定
#---------------------------
# pyenv 設定
if [ "`which pyenv`" ]; then
  eval "$(pyenv init -)"
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

# pyenv-virtualenv 設定
if [ "`which pyenv-virtualenvs`" ]; then
  eval "$(pyenv virtualenv-init -)"
fi

#---------------------------
# Ruby 設定
#---------------------------
# rbenv 設定
if [ "`which rbenv`" ]; then
  eval "$(rbenv init -)"
fi

#---------------------------
# Node.js 設定
#---------------------------
if [ "`which nodenv`" ]; then
  eval "$(nodenv init -)"
fi
