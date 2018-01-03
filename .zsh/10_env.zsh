#文字コード指定
export LANG=ja_JP.UTF-8

# 基本PATH設定
export PATH=/usr/local/bin:/usr/bin:$HOME/.zsh/bin:${PATH}

# Edita設定
if [ -e /usr/local/bin/vim ]; then
  export EDITOR=/usr/local/bin/vim
fi

# vim pager設定
if [ -e /usr/local/bin/vimpager ]; then
  export PAGER=/usr/local/bin/vimpager
  export MANPAGER=/usr/local/bin/vimpager
fi

# Go設定
if [ "`which go`" ]; then
 export GOPATH=${HOME}/.go
 export PATH=${GOPATH}/bin:$PATH
fi

# TERM設定
export TERM=xterm-256color

# 重複環境パス削除
typeset -U path cdpath fpath manpath
path=(
  ${HOME}/bin/(N-/)
  /usr/local/bin/(N-/)
  /usr/local/sbin/(N-/)
  ${path}
)
