"-------------------------
" 基本 Key Mapping
"-------------------------
" Yの動作をDやCと同じにする
map Y y$

" <C-L>で検索後の強調表示を解除する
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" ; :を入れ替える
noremap ; :

" mapleader を <Space> に指定
let mapleader = "\<Space>"

" ファイル保存
nnoremap <Leader>w :w<cr>

" カーソル下の単語を置換の対象にする
nnoremap <Leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" 行の移動
nnoremap <Leader>k :m-2<cr>==
nnoremap <Leader>j :m+<cr>==
noremap <Leader>k :m-2<cr>gv=gv
xnoremap <Leader>j :m'>+<cr>gv=gv

" 分割したウインドウを HJKL で場所を移動
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L
nnoremap <Leader>H <C-w>H

" 画面を横に分割
nnoremap <Leader>s :<C-u>sp<CR>
" 画面を縦に分割
nnoremap <Leader>v :<C-u>vs<CR>

" 縦横に最大化
nnoremap <Leader>o <C-w>_<C-w>\|
" 幅を揃える
nnoremap <Leader>= <C-w>=

" create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <Leader>B :enew<cr>
" close current buffer
nnoremap <Leader>q :bp <bar> bd! #<cr>

" Tab to switch to next open buffer
nnoremap <Leader>n :bnext<cr>
" Shift + Tab to switch to previous open buffer
nnoremap <Leader>p :bprevious<cr>
" leader key twice to cycle between last two open buffers
nnoremap <Leader><Leader> <c-^>

" tagファイル生成のショートカット
nnoremap <Leader>tc :!ctags -Rf .git/tags<cr><cr>

let g:pid = getpid()
let g:tag_file_path = "/tmp/" . g:pid . "_tags"
function! _CtagsUpdate()
    exe '!ctags -R -f '.g:tag_file_path.' `pwd` &'
    exe 'set tags='.g:tag_file_path
endfunction
command! CtagsUpdate call _CtagsUpdate()

function! _CtagsRemove()
    exe '!rm '.g:tag_file_path
endfunction
command! CtagsRemove call _CtagsRemove()

let current_path = expand("%:p")
let match_idx = match(current_path, ".git")
if match_idx != -1
    autocmd VimEnter * silent! :CtagsUpdate
    autocmd BufWrite * silent! :CtagsUpdate
    autocmd VimLeave * silent! :CtagsRemove
endif

" カーソルの単語の定義先にジャンプ（複数候補はリスト表示）
nnoremap <Leader>tj :exe("tjump ".expand('<cword>'))<CR>
" tag stack を戻る
nnoremap <Leader>tp :pop<CR>
" tag stack を進む
nnoremap <Leader>tn :tag<CR>
" 縦にウィンドウを分割してジャンプ
nnoremap <Leader>tv :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" 横にウィンドウを分割してジャンプ
nnoremap <Leader>ts :split<CR> :exe("tjump ".expand('<cword>'))<CR>
" 新しいタブでジャンプ
nnoremap <Leader>tt :tab sp<CR> :exe("tjump ".expand('<cword>'))<CR>
" tag list を表示
nnoremap <Leader>tl :ts<CR>
