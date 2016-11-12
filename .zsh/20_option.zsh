## cd履歴を補完
setopt auto_pushd

# auto_pushdの重複をさせない
setopt pushd_ignore_dups

## コマンド間違い修正
setopt correct

# ワイルドカードによるファイル名生成のパターンにマッチするものがなかった場合エラーにしない
setopt nonomatch

# 補完を詰めて表示
setopt list_packed

# 補完候補一覧でファイルの種別を識別マーク表示
setopt list_types

## PATH保管時に/をつける
setopt noautoremoveslash

# beep音をなくす
setopt nolistbeep

# バックグラウンドのジョブが終了したら知らせる
setopt no_tify

# タブで順に補完候補を切り替える
setopt auto_menu

# 自動補完される余分なカンマなどを適宜削除してスムーズに入力できるようにする
setopt auto_param_keys

# 語の途中でもカーソル位置で補完
setopt complete_in_word

# カーソル位置は、保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt

# コマンドラインでも # 以降をコメントとみなす
setopt interactive_comments

# コマンドラインの引数で --prefix= などの = 以降でも補完できるようにする
setopt magic_equal_subst

# 補完履歴保存
HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数(保存数だけ履歴を検索できる)
HISTSIZE=50000

# HISTFILE で指定したファイルに保存される履歴の件数
SAVEHIST=50000

# 重複して記録させない
setopt hist_ignore_dups

# コマンド履歴をターミナル間で共有する
setopt share_history

# PROMPT変数内で変数参照する    
setopt prompt_subst   
