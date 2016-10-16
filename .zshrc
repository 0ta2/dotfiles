# zshディレクトリ指定
zdir=${HOME}/.zsh

# zshファイルを読み込む
for zfile in ${zdir}/[0-9]*.zsh
do
  source $zfile
done

# 自作関数読み込み
fpath=(${zdir}/function(N-/) $fpath)

# 自作補完関数読み込み
fpath=(${zdir}/Completion(N-/) $fpath)

# 補完強化機能有効化
autoload -Uz compinit
compinit -u
