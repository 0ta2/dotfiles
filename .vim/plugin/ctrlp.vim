" 隠しファイルを表示
let g:ctrlp_show_hidden=1

" 日本語ファイルも検索できるように
let g:ctrlp_key_loop = 1

" キャッシュディレクトリ指定
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" キャッシュを終了時に削除しない
let g:ctrlp_clear_cache_on_exit = 0

" 遅延再描画
let g:ctrlp_lazy_update = 1

" ルートパスと認識させるためのファイル
let g:ctrlp_root_markers = ['.git', '.hg', '.svn']

" CtrlPのウィンドウ最大高さ
let g:ctrlp_max_height = 20

" 無視するディレクトリ
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
