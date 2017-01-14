"--------------
" vim-plug
"--------------
call plug#begin('~/.vim/plugged')

" helpの日本語訳
Plug 'vim-jp/vimdoc-ja'

" ファイルツリー表示
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" 高速カーソル移動
Plug 'rhysd/accelerated-jk'

" git
Plug 'cohama/agit.vim'
Plug 'tpope/vim-fugitive'

" vimカラー変更
Plug 'aereal/vim-colors-japanesque'
Plug 'tomasr/molokai'
Plug 'raphamorim/lucario'
Plug 'w0ng/vim-hybrid'

" ファイル検索
Plug 'ctrlpvim/ctrlp.vim'

" 補完
Plug 'Shougo/neocomplete.vim'

" preview
Plug 'kannokanno/previm'

call plug#end()

" OS判定
let OSTYPE = system('uname')

"--------------
" Load vim files
"--------------
" load vimfiles
runtime! vimrc.d/*.vim
