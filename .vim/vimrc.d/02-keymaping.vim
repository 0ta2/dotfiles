"--------------
" Basic Key Mapping
"--------------
" 検索後の強調表示を解除する
noremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" ; :を入れ替える
noremap ; :

" jj でEsc
inoremap <silent> jj <Esc>

" ファイル保存
nnoremap <silent> <Leader>w :w<CR>

" カーソル下の単語をハイライトする
nnoremap * "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

" 行が折り返し表示されたいた場合、表示行単位で移動する
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" 行の移動
nnoremap <silent> <Leader>k :m-2<CR>==
nnoremap <silent> <Leader>j :m+<CR>==
xnoremap <silent> <Leader>k :m-2<CR>gv=gv
xnoremap <silent> <Leader>j :m'>+<CR>gv=gv

" 画面を横に分割
nnoremap <silent> <Leader>s :<C-u>sp<CR>
" 画面を縦に分割
nnoremap <silent> <Leader>v :<C-u>vs<CR>

" 縦横に最大化
nnoremap <Leader>o <C-w>_<C-w>\|
" 幅を揃える
nnoremap <Leader>= <C-w>=

" Create new buffer.
nnoremap <silent> <Leader>t :enew<cr>
" close current buffer.
nnoremap <silent> <Leader>q :bp <bar> bd! #<cr>
" Tab to switch to next open buffer.
nnoremap <silent> <Leader>n :bnext<cr>
" Shift + Tab to switch to previous open buffer.
nnoremap <silent> <Leader>p :bprevious<cr>

" 削除してもレジスタに入らないようにする
nnoremap x "_x
nnoremap s "_s

" 全角英数字を半角に変換
nnoremap <Leader>zh :HzjaConvert han_eisu
vnoremap <Leader>zh :HzjaConvert han_eisu

" blade のフォーマット
nnoremap <Leader>fo :%!blade-formatter --stdin<CR>
