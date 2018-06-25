# zshディレクトリ指定
zdir=${HOME}/.zsh

# zshファイルを読み込む
for zfile in ${zdir}/[0-9]*.zsh
do
  source $zfile
done

# functionファイルを読み込む
for func in ${zdir}/functions/*
do
  source $func
done

# 自作補完関数読み込み
fpath=(${zdir}/Completion(N-/) $fpath)

# zsh-completions読み込み
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# fzf設定
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=30
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# 補完強化機能有効化
autoload -Uz compinit
compinit -u
