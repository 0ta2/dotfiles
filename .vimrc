"--------------
" vim-plug
"--------------
call plug#begin('~/.vim/plugged')

" ファイルツリー表示
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" 高速カーソル移動
Plug 'rhysd/accelerated-jk'

" vimカラー変更
Plug 'aereal/vim-colors-japanesque'
Plug 'tomasr/molokai'

call plug#end()

" load vimfiles
runtime! vimrc.d/*.vim
