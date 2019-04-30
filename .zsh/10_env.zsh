#--------------
# ENV設定
#--------------
# 文字コード指定
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

# gvm設定
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# powerline
if [ "`which python`" ];then
  export PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi

if [ -e /Applications/Alacritty.app/Contents/MacOS/alacritty ];then
	export PATH=/Applications/Alacritty.app/Contents/MacOS:${PATH}
fi

# WSL を使っている場合の PATH 設定
if [[ $(uname -a) =~ Linnux && $(uname -a) =~ Microsoft ]]; then
  export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
  export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
fi

# TERM設定
export TERM=xterm-256color

#--------------
# fzf設定
#--------------
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  export FZF_TMUX=1
  export FZF_TMUX_HEIGHT=30
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
fi

# 重複環境パス削除
typeset -U path cdpath fpath manpath
path=(
  ${HOME}/bin/(N-/)
  /usr/local/bin/(N-/)
  /usr/local/sbin/(N-/)
  ${path}
)
