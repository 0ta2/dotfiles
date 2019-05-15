#--------------
# zprofile
# ログインシェルの場合に一度だけ読み込まれる
#--------------
# typeset
#   -U 重複パスを登録しない
#   -x export も同時に行う
#   -T環境変数へ紐づけ
typeset -U path cdpath fpath manpath

#   path=xxxx(N-/)
#     (N-/): 存在しないディレクトリは登録しない
#     パス(...): ...という条件にマッチするパスのみ残す
#        N: NULL_GLOBオプションを設定。
#           globがマッチしなかったり存在しないパスを無視する
#        -: シンボリックリンク先のパスを評価
#        /: ディレクトリのみ残す
#        .: 通常のファイルのみ残す
# 基本PATH設定
# ${path} は､大文字の PATH と紐付いている
path=(
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /usr/bin(N-/)
  $HOME/.zsh/bin(N-/)
  $HOME/.fzf/bin(N-/)
  ${path}
)

#--------------
# 独自の環境変数
#--------------
# dotfiles の PATHを環境変数に読み込ませる
export DOTFILES_PATH="${HOME}/.ghq/github.com/0ta2/dotfiles"

#--------------
# 環境変数設定
#--------------
# TERM設定
export TERM=xterm-256color

# 文字コード指定
export LANG=ja_JP.UTF-8

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

if [ -e /Applications/Alacritty.app/Contents/MacOS/alacritty ];then
	export PATH=/Applications/Alacritty.app/Contents/MacOS:${PATH}
fi

# WSL を使っている場合の PATH 設定
if [[ $(uname -a) =~ Linnux && $(uname -a) =~ Microsoft ]]; then
  export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
  export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
fi

#--------------
# fzf設定
#--------------
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  export FZF_TMUX=1
  export FZF_TMUX_HEIGHT=30
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
fi

#########################################################
# Env系																									#
# macの場合は､ /etc/zprofile で上書きされてしまう｡			#
# そのため､ $ZDOTDIR/.zprofile で上書きする必要がある｡  #
#########################################################
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
