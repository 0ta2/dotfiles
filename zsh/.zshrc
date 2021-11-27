#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


# -----------------
# Customization
# -----------------

# functionファイルを読み込む
for funcs in ${ZDOTDIR}/functions/*
do
  source $funcs
done

### 環境変数設定

# 独自関数
export DOTFILES_PATH="${HOME}/ghq/github.com/0ta2/dotfiles"

### 環境変数設定
export EDITOR=nvim

#TERM設定
export TERM=screen-256color

# 文字コード指定
export LANG=ja_JP.UTF-8

### PATH 設定

# コマンド補完を有効化
fpath=(/usr/local/share/zsh/site-functions $fpath)

# GOPATH設定
export GOPATH=$HOME/go
export GOBIN="$GOPATH/bin"
export PATH="$GOPATH/bin:${PATH}"

# WSL を使っている場合の PATH 設定
if [[ $(uname -a) =~ Linnux && $(uname -a) =~ Microsoft ]]; then
  export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
  export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
fi

# Alacritty の PATH 設定
if [ -e /Applications/Alacritty.app/Contents/MacOS/alacritty ];then
	export PATH=/Applications/Alacritty.app/Contents/MacOS:${PATH}
fi

# mysql-client
if [ "`which mysql`" ]; then
  export PATH="/usr/local/opt/mysql-client/bin:$PATH"
fi

# less コマンドの環境変数
export LESS='--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD'

### fzf 設定
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  export FZF_TMUX=1
  export FZF_TMUX_HEIGHT=30
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
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
  $HOME/.nodenv/shims(N-/)
  ${path}
)

### Env系
# macの場合は､ /etc/zprofile で上書きされてしまう｡
# そのため､ $ZDOTDIR/.zprofile で上書きする必要がある｡

# pyenv 設定
if [ "`which pyenv`" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# pyenv-virtualenv 設定
if [ "`which pyenv-virtualenvs`" ]; then
  eval "$(pyenv virtualenv-init -)"
fi

# pipenv の補完有効化
if [ "`which pipenv`" ];then
  eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"
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

# ls
alias ls="gls --color=auto"

# PHPstrom
alias p="open -a PhpStorm ."
