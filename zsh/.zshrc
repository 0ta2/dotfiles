#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------
# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

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

# コマンド補完を有効化
if [ $(uname -m) = 'x86_64' ]; then
  fpath=(/usr/local/share/zsh/site-functions $fpath)
elif [ "$(uname -m)" = 'arm64' ]; then
  fpath=(/opt/homebrew/share/zsh/site-functions/ $fpath)
fi

# homebrew
if [[ $(uname -m) == "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# functionファイルを読み込む
for funcs in ${ZDOTDIR}/functions/*
do
  source $funcs
done

if [ -f ~/.zshrc.dev ]; then
  source ~/.zshrc.dev
fi

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
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

#
# 環境変数設定
#

### PATH 設定
# less コマンドの環境変数
export LESS='--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD'

### fzf 設定
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  export FZF_TMUX=1
  export FZF_TMUX_HEIGHT=30
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
fi

# GOPATH設定
export GOPATH=$HOME/go
export GOBIN="$GOPATH/bin"
export PATH="$GOPATH/bin:${PATH}"

### Env系
if [ "`which mise`" ]; then
    if [[ $(uname -m) == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/mise activate zsh)"
    else
        eval "$(/usr/local/bin/mise activate zsh)"
    fi
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
  /usr/local/go/bin(N-/)
  /usr/bin(N-/)
  ${ZDOTDIR}/bin(N-/)
  $HOME/.fzf/bin(N-/)
  $HOME/go/bin(N-/)
  ${path}
)

# -----------------
# Zsh configuration
# -----------------

# 重複するコマンドを追加する場合は、履歴から古いコマンドを削除する。
setopt HIST_IGNORE_ALL_DUPS

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
alias gbr="git branch --merged | grep -vE '^\*|master$|main$|develop$' | xargs -I % git branch -d %"

# nvim
alias vim="nvim"

# cd 系
alias ..2='cd ../../'
alias ..3='cd ../../..'

# GNU
alias sed="gsed"

# ls
alias ls="gls --color=auto"

# clear
alias c="clear"
