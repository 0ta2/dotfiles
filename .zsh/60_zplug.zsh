# zplugの管理

source ~/.zplug/init.zsh

# ユーザ名/リポジトリ名 で記述
zplug "zsh-users/zsh-completions"

# check コマンドで未インストール項目があるかどうか verbose にチェックし
# false のとき（つまり未インストール項目がある）y/N プロンプトでインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# プラグインを読み込み、コマンドにパスを通す
zplug load --verbose
