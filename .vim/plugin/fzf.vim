"--------------
" グローバル設定
"--------------
" 検索結果をどのように表示するか
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" 検索画面をどこに表示するか
" down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

"--------------
" キーバインド
"-------------
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>c :Commands<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>k :bd<CR>

"--------------
" コマンド設定
"--------------
" :Files コマンド時にファイルプレビューを表示する
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" :Ag コマンド時に ? を入力するとプレビューを表示する
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
