#--------------
# zsh 基本設定
#--------------
# zshディレクトリ指定
zdir=${HOME}/.zsh

# zshファイルを読み込む
for zfiles in ${zdir}/[0-9]*.zsh
do
  source $zfiles
done

# functionファイルを読み込む
for funcs in ${zdir}/functions/*
do
  source $funcs
done

# 自作補完関数読み込み
fpath=(${zdir}/Completion(N-/) $fpath)

# zsh-completions読み込み
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# 補完強化機能有効化
autoload -Uz compinit
compinit -u
