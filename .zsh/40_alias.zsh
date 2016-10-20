# エイリアスでも補完を有効
setopt complete_aliases

# OS毎にaliasを変更
case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="gls --color=auto"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

# システム系
alias where="command -v"
alias j="jobs -l"
alias su="su -l"

# ls系
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -la"

# 便利系
alias vimtmp="vim /tmp/tmp_`date '+%Y%m%d_%H%M%S'`.txt"
