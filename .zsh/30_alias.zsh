# エイリアスでも補完を有効
setopt complete_aliases

# OS毎にaliasを変更
case "${OSTYPE}" in
darwin*)
    # Mac向け
    alias ls="gls --color=auto"
    ;;
linux*)
    # Linux向け
    alias ls="ls --color"
    ;;
esac

# ls関連
alias ll="ls -la"

# Git関連
alias gbr="git branch --merged | grep -vE '^\*|master$|develop$' | xargs -I % git branch -d %"

# nvim
alias vim="nvim"
