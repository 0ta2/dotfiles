"--------------
" グローバル設定
"--------------
" 検索結果をどのように表示するか
" ctrl-t タブで表示
" ctrl-s 画面を横に分割
" ctrl-v 画面を立てに分割
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" 検索画面をどこに表示するか
" down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

"--------------
" キーバインド
"--------------
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>c :Commands<CR>
nnoremap <Leader>g :GFiles?<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>r :Rg<CR>

"--------------
" コマンド設定
"--------------
" :Files コマンド時にファイルプレビューを表示する
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 0,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
