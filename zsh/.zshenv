#
# User configuration sourced by all invocations of the shell
#

# Define XDG_CONFIG_HOME location
export XDG_CONFIG_HOME="$HOME/.config"

# Dfine XDG_STATE_HOME location
export XDG_STATE_HOME="$HOME/.local/state"

# Dfine ZDOTDIR location
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Define Zim location
export ZIM_HOME=$XDG_CONFIG_HOME/zim

# 独自関数
export DOTFILES_PATH="${HOME}/ghq/github.com/0ta2/dotfiles"

### 環境変数設定
export EDITOR=nvim

#TERM設定
export TERM=screen-256color

# 文字コード指定
export LANG=ja_JP.UTF-8

# chronoship の環境変数
export EXCLUDE_WIDGETS_REGEX="fzf"

# typeset
#   -U 重複パスを登録しない
#   -x export も同時に行う
#   -T環境変数へ紐づけ
typeset -U path cdpath fpath manpath
