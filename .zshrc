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

# 補完強化機能有効化
# -Uビルトイン関数を読み込むときにユーザ定義の alias を上書きしない
# -z zsh形式での読み込みを指定
autoload -Uz compinit
compinit -u
