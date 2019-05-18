# プロンプトの説明
# %s              バージョン管理システム名
#                 e.g. git, svn hg
#                 $hook_com[vcs] で参照可能

# %b              カレントブランチ名を展開
#                 $hook_com[branch] で参照可能
#
# %i              リビジョン番号またはリビジョンID
#                 $hook_com[revision] で参照可能
#
# %r              リポジトリ名
#                 $hook_com[base-name] で参照可能
#
# %R              リポジトリのルートディレクトリのパス
#                 $hook_com[base] で参照可能
#
# %S              リポジトリルートから見た今のディレクトリの相対パス
#                 $hook_com[subdir] で参照可能
#
# %a              アクション名(mergeなど) actionformats のみ指定可能
#                 $hook_com[action] で参照可能
#
# %c              ステージされていてコミットされていないファイルがareba,
#                 stagedstr に展開される｡ない場合は空｡
#                 $hook_com[staged] で参照可能
#
# %u              ステージされていない変更ファイルがあった時に unstagedstr で
#                 指定した文字列に展開される｡ない場合は空｡
#                 $hook_com[unstaged] で参照可能
#
# %m              その他の情報
#                 $hook_com[misc] で参照可能
#
# actionformats   rebase途中だったり､ merge でコンフリクト発生したり
#                 特別な状況時に formats の代わりに actionformats で
#                 指定した文字列が $vcs_info_msg_0_ に格納される｡



# プロンプトで使う色の定義
autoload -Uz colors
colors
local DEFAULT=%{$reset_color%}
local BLACK=%{$fg[black]%}
local RED=%{$fg[red]%}
local GREEN=%{$fg[green]%}
local YELLOW=%{$fg[yellow]%}
local BLUE=%{$fg[blue]%}
local MAGENTA=%{$fg[magenta]%}
local CYAN=%{$fg[cyan]%}
local WHITE=%{$fg[white]%}

# git情報を表示
autoload -Uz vcs_info
# プロンプト表示するために変数展開
setopt prompt_subst
# true を指定すると formats で %c と %u が使えるようになる
# 大きなリポジトリの際には､重くなることがあるので注意｡
# default: false
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr         "%F${YELLOW}+" # 黄色い文字の + で表示
zstyle ':vcs_info:git:*' unstagedstr       "%F${RED}-"    # 赤い文字の - で表示

# 表示するスタイルを指定
zstyle ':vcs_info:*'     formats           "%F${GREEN}%c%u%b%f"
zstyle ':vcs_info:*'     actionformats     "%b|%a"
precmd () {
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# 補完を見やすくする
zstyle ':completion:*' verbose true

# 補完方法の設定
#  _oldlist				前回の補完結果を再利用
#  _complete			補完
#  _match 				globを展開しないで候補の一覧から補完
#  _history				ヒストリのコマンドから補完
#  _ignored				補完候補にださないと指定したものもから補完
#  _approximate		似ている候補を補完
#  _correct				綴り修正(入力を終えた部分のみ修正)
#  _prefix				カーソル以降を無視してカーソル位置までで補完
#  _list, expand, etc<Paste>
zstyle ':completion:*' completer \
					_oldlist _complete _match _history _ignored _approximate _prefix
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# tab を押した時の表示
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# 補完表示の時のセパレータを指定
zstyle ':completion:*' list-separator '-->'

# 変数の添字を保管する
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# 補完候補を上下右左で選択できるようにする
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# カラー設定ファイルを読み込み
case ${OSTYPE} in
  darwin*)
    eval $(gdircolors $HOME/.zsh/dircolors/dircolors-solarized/dircolors.256dark)
  ;;
  linux*)
    eval $(dircolors $HOME/.zsh/dircolors/dircolors-solarized/dircolors.256dark)
  ;;
esac

# 補完後方にもカラー設定を適用
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# 通常のプロンプト
PROMPT='[${GREEN}%n@%m${DEFAULT}] %#
${MAGENTA}%T >>> ${DEFAULT}'

# 右プロンプト
RPROMPT='[${vcs_info_msg_0_} ${CYAN}%d${DEFAULT}]'

# コマンドを間違えた時のプロンプト
SPROMPT="correct: %R -> %r ? [No/Yes/Abort/Edit]"

# 自動的に右プロンプトを非表示
setopt transient_rprompt
