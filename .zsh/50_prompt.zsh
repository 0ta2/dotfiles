# 補完でカラー使用
autoload colors
colors

# git情報を表示
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
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
zstyle :compinstall filename '${HOME}/.zshrc'

# UIDでプロンプトの色を分ける
case ${UID} in
  0)
    # rootユーザ
    PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
  ;;
  *)
    # 一般ユーザ
    # 通常プロンプト
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[blue]}%}%/#%{${reset_color}%}%b "$'\n'
    # 右プロンプト
    RPROMPT=[%*]$RPROMPT'${vcs_info_msg_0_}'
    # 2行以上入力する際のプロンプト
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    # コマンド入力ミスの時に表示するプロンプト
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    # SSH接続時のプロンプト
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
  ;;
esac

# lsのカラー表示
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

# TERM毎に分岐
case "${TERM}" in
  xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
  kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
  kterm)
    stty erase '^H'
  ;;
  cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
  jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
  xterm-256color)
   # eval $(gdircolors $HOME/dotfiles/zsh/color/dircolors.ansi-dark)
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  ;;
esac

# ターミナルタブの表示名変更
case "${TERM}" in
  xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
  ;;
esac
