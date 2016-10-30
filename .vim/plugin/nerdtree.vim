" <C-e>でNERDTreeをオンオフ いつでもどこでも
nmap <silent> <Leader>e      :NERDTreeToggle<CR>
vmap <silent> <Leader>e <Esc>:NERDTreeToggle<CR>
omap <silent> <Leader>e      :NERDTreeToggle<CR>
imap <silent> <Leader>e <Esc>:NERDTreeToggle<CR>
cmap <silent> <Leader>e <C-u>:NERDTreeToggle<CR>

" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 無視するファイルを設定する
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']

" 隠しファイルを表示するか
" 0 : 表示しない
" 1 : 表示する
let g:NERDTreeShowHidden=1

" ブックマークやヘルプのショートカットをメニューに表示する
" 0 : 表示しない
" 1 : 表示する
let g:NERDTreeMinimalUI=1

" ブックマークを最初から表示するようにする
" 0 : 表示しない
" 1 : 表示する
let g:NERDTreeShowBookmarks=1

" Tree表示をどうするか
" 0 : +|を使い綺麗に見せる
" 1 : +|`などを使わない
let g:NERDTreeDirArrows=0
