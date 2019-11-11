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

" jj でESCAPE
inoremap <silent>jj <Esc>

" ファイル保存
nnoremap <Leader>w :w<cr>

" カーソル下の単語をハイライトする
nnoremap <silent> <Leader><Leader> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

nmap <Leader>* <Leader><Leader>:%s/<C-r>///g<Left><Left>

" 行が折り返し表示されたいた場合、表示行単位で移動する
nnoremap j gj
nnoremap k gk

" 行の移動
nnoremap <Leader>k :m-2<cr>==
nnoremap <Leader>j :m+<cr>==
noremap <Leader>k :m-2<cr>gv=gv
xnoremap <Leader>j :m'>+<cr>gv=gv
" カーソル下の単語を置換の対象にする

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
nnoremap <silent><Leader>B :enew<cr>
" close current buffer
nnoremap <silent><Leader>q :bp <bar> bd! #<cr>

" Tab to switch to next open buffer
nnoremap <Leader>n :bnext<cr>
" Shift + Tab to switch to previous open buffer
nnoremap <Leader>p :bprevious<cr>

" 削除してもレジスタに入らないようにする(visualモードのときは例外)
nnoremap x "_x
nnoremap s "_s

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
