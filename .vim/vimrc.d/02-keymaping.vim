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

" カーソルの単語の定義先にジャンプ（複数候補はリスト表示）
nnoremap tj :exe("tjump ".expand('<cword>'))<CR>

" tag stack を戻る
nnoremap tp :pop<CR>

" tag stack を進む
nnoremap tn :tag<CR>

" 縦にウィンドウを分割してジャンプ
nnoremap tv :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>

" 横にウィンドウを分割してジャンプ
nnoremap ts :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" 新しいタブでジャンプ
nnoremap tt :tab sp<CR> :exe("tjump ".expand('<cword>'))<CR>

" tag list を表示
nnoremap tl :ts<CR>
