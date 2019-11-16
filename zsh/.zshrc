#
# User configuration sourced by interactive shells
#

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

#
# Customize
#

# functionファイルを読み込む
for funcs in ${ZDOTDIR}/functions/*
do
  source $funcs
done

### 環境変数設定

# 独自関数
export DOTFILES_PATH="${HOME}/.ghq/github.com/0ta2/dotfiles"

### 環境変数設定
export EDITOR=nvim

#TERM設定
export TERM=screen-256color

# 文字コード指定
export LANG=ja_JP.UTF-8

### PATH 設定

# WSL を使っている場合の PATH 設定
if [[ $(uname -a) =~ Linnux && $(uname -a) =~ Microsoft ]]; then
  export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
  export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
fi

# Alacritty の PATH 設定
if [ -e /Applications/Alacritty.app/Contents/MacOS/alacritty ];then
	export PATH=/Applications/Alacritty.app/Contents/MacOS:${PATH}
fi

### fzf 設定
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  export FZF_TMUX=1
  export FZF_TMUX_HEIGHT=30
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
fi

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
  ${ZDOTDIR}/bin(N-/)
  $HOME/.fzf/bin(N-/)
  ${path}
)

### Env系
# macの場合は､ /etc/zprofile で上書きされてしまう｡
# そのため､ $ZDOTDIR/.zprofile で上書きする必要がある｡

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

# pipenv の補完有効化
if [ "`which pipenv`" ];then
  eval "$(pipenv --completion)"
fi

# rbenv 設定
if [ "`which rbenv`" ]; then
  eval "$(rbenv init -)"
fi

# nodenv 設定
if [ "`which nodenv`" ]; then
  eval "$(nodenv init -)"
fi

### Optin

# 隠しファイル補完候補に表示
setopt globdots

# コマンド間違い修正
setopt correct

# ワイルドカードによるファイル名生成のパターンにマッチするものがなかった場合エラーにしない
setopt nonomatch

# 補完を詰めて表示
setopt list_packed

# 補完候補一覧でファイルの種別を識別マーク表示
setopt list_types

## PATH保管時に/をつける
setopt noautoremoveslash

# beep音をなくす
setopt nolistbeep

# バックグラウンドのジョブが終了したら知らせる
setopt no_tify

# 自動補完される余分なカンマなどを適宜削除してスムーズに入力できるようにする
setopt auto_param_keys

# 語の途中でもカーソル位置で補完
setopt complete_in_word

# カーソル位置は、保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt

# コマンドラインでも # 以降をコメントとみなす
setopt interactive_comments

# コマンドラインの引数で --prefix= などの = 以降でも補完できるようにする
setopt magic_equal_subst

# メモリに保存される履歴の件数(保存数だけ履歴を検索できる)
HISTSIZE=50000

# HISTFILE で指定したファイルに保存される履歴の件数
SAVEHIST=50000

# 重複して記録させない
setopt hist_ignore_dups

# コマンド履歴をターミナル間で共有する
setopt share_history

# PROMPT変数内で変数参照する
setopt prompt_subst

### Keybind
# 履歴を表示する時にカーソルは末尾
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end  #<C-p>
bindkey "^n" history-beginning-search-forward-end   #<C-n>

### Alias
# エイリアスでも補完を有効
setopt complete_aliases

# Git関連
alias gbr="git branch --merged | grep -vE '^\*|master$|develop$' | xargs -I % git branch -d %"

# nvim
alias vim="nvim"

# cd 系
alias ..2='cd ../../'
alias ..3='cd ../../..'

# GNU
alias sed="gsed"

# ls系
alias ls="gls --color=auto"

### Prompt
# 変数の添字を保管する
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
