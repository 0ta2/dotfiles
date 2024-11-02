# Cheat Sheet

## basic

- :e                                : ファイルを編集
- :r                                : 入力をバッファを挿入する
- <Leader> + q                      : カレントのバッファを閉じる
- <Leader> + n                      : 次のバッファに移動
- <Leader> + p                      : 前のバッファに移動
- 'gc + c'                          : コメントアウト

## winresizer plugin

- Ctrl + e                          : 画面リサイズ開始
  - f                               : 画面選択モード
  - m                               : 移動モード開始
  - r                               : リサイズモード開始

## vim-surround

- cs + [置換したい前][置換後も文字] : 文字の置換
    - ex.) cs"'                     : 囲い文字を"から'に変更
- ds + [削除したい文字]             : 文字の削除
