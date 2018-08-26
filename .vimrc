"--------------
" vim-plug
"--------------
call plug#begin('~/.vim/plugged')

" helpの日本語訳
Plug 'vim-jp/vimdoc-ja'

" ファイルツリー表示
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" タブ毎に変わっていまうツリー状態をタブ間で共有する
Plug 'jistr/vim-nerdtree-tabs'
" ファイルに変更があった場合に､｢+｣､｢-｣ で表示する
Plug 'airblade/vim-gitgutter'

" 高速カーソル移動
Plug 'rhysd/accelerated-jk'

" Git関連
Plug 'cohama/agit.vim'
Plug 'tpope/vim-fugitive'

" vimカラー
Plug 'aereal/vim-colors-japanesque'
Plug 'tomasr/molokai'
Plug 'raphamorim/lucario'
Plug 'w0ng/vim-hybrid'

" インデントの深さを可視化してくれる
Plug 'nathanaelkane/vim-indent-guides'

" フィあるに末尾にあるスペースを可視化する
Plug 'bronson/vim-trailing-whitespace'

" ファイル検索
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" 補完
Plug 'Shougo/neocomplete.vim'
Plug 'davidhalter/jedi-vim'

" 対応する括弧を入力
Plug 'kana/vim-smartinput'

" スニペット
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" markdown preview
Plug 'kannokanno/previm'

" vim-json
Plug 'elzr/vim-json'

" Qfixhowm
Plug 'fuenor/qfixhowm'

call plug#end()

" OS判定
let OSTYPE = system('uname')

"--------------
" Load vim files
"--------------
runtime! vimrc.d/*.vim

"--------------
" QfixHowm の設定ファイル読み込み
"--------------
set runtimepath+=~/.vim/plugged/qfixhowm
