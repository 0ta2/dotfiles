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

" 分割したウインドウ間を hjkl で移動
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h

" 分割したウインドウを HJKL で場所を移動
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L
nnoremap <Leader>H <C-w>H

" 画面を横に分割
nnoremap <Leader>s :<C-u>sp<CR>
" 画面を縦に分割
nnoremap <Leader>v :<C-u>vs<CR>

" 新しいタブを開く
nnoremap <Leader>t :<C-u>tabnew<CR>

" 次のタブに移動
nnoremap <Leader>n gt
" 前のタブに移動
nnoremap <Leader>p gT
