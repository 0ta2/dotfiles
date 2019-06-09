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
nnoremap <leader>w :w<cr>

" カーソル下の単語を置換の対象にする
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" 行の移動
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

" 分割したウインドウを HJKL で場所を移動
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L
nnoremap <leader>H <C-w>H

" 画面を横に分割
nnoremap <leader>s :<C-u>sp<CR>
" 画面を縦に分割
nnoremap <leader>v :<C-u>vs<CR>

" create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>B :enew<cr>
" close current buffer
nnoremap <leader>bq :bp <bar> bd! #<cr>
"close all open buffers
nnoremap <leader>ba :bufdo bd!<cr>

" Tab to switch to next open buffer
nnoremap <Tab> :bnext<cr>
" Shift + Tab to switch to previous open buffer
nnoremap <S-Tab> :bprevious<cr>
" leader key twice to cycle between last two open buffers
nnoremap <leader><leader> <c-^>

" tagファイル生成のショートカット
nnoremap <leader>tc :!ctags -Rf .git/tags<cr><cr>

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
nnoremap <leader>tj :exe("tjump ".expand('<cword>'))<CR>
" tag stack を戻る
nnoremap <leader>tp :pop<CR>
" tag stack を進む
nnoremap <leader>tn :tag<CR>
" 縦にウィンドウを分割してジャンプ
nnoremap <leader>tv :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" 横にウィンドウを分割してジャンプ
nnoremap <leader>ts :split<CR> :exe("tjump ".expand('<cword>'))<CR>
" 新しいタブでジャンプ
nnoremap <leader>tt :tab sp<CR> :exe("tjump ".expand('<cword>'))<CR>
" tag list を表示
nnoremap <leader>tl :ts<CR>
