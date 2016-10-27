#色の定義
autoload -Uz colors
colors

local DEFAULT=$'%{\e[1;m%}'
local RED=$'%{\e[31m%}'
local GREEN=$'%{\e[32m%}'
local YELLOW=$'%{\e[33m%}'
local BLUE=$'%{\e[34m%}'
local PURPLE=$'%{\e[35m%}'
local CYAN=$'%{\e[36m%}'
local WHITE=$'%{\e[1;37m%}'

# git情報を表示
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr         "%F!"
zstyle ':vcs_info:git:*' unstagedstr       "%F+"
zstyle ':vcs_info:*'     formats           "%F%c%u[%b]%f"
zstyle ':vcs_info:*'     actionformats     "[%b|%a]"
precmd () {
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}


# 補完を見やすくする
zstyle ':completion:*' verbose true

# 各種補完を有効にする
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate

zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s

# 補完表示の時のセパレータを指定
zstyle ':completion:*' list-separator '-->'

# 変数の添字を保管する
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# 補完候補を上下右左で選択できるようにする
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# カラー設定ファイルを読み込み
eval $(gdircolors $HOME/.zsh/dircolors/dircolors.256dark)
#eval $(gdircolors $HOME/.zsh/dircolors/dircolors.ansi-dark)

# 補完後方にもカラー設定を適用
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# 通常のプロンプト
PROMPT='[%n@%m] ${vcs_info_msg_0_}%#
%T >>> '

# 右プロンプト
RPROMPT="[%d]"
# コマンドを間違えた時のプロンプト
SPROMPT="correct: %R -> %r ? [No/Yes/Abort/Edit]"

# 自動的に右プロンプトを非表示
setopt transient_rprompt
