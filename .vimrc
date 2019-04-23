"--------------
" vim-plug
"--------------
call plug#begin('~/.vim/plugged')

"--------------
" Other
"--------------
" helpの日本語訳
Plug 'vim-jp/vimdoc-ja'
Plug 'rhysd/accelerated-jk'

"--------------
" ファイルツリー関連
"--------------
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" タブ毎に変わっていまうツリー状態をタブ間で共有
Plug 'jistr/vim-nerdtree-tabs'
" ファイルに変更があた場合に、ツリーに表示
Plug 'Xuyuanp/nerdtree-git-plugin'

"--------------
" ファイル関連
"--------------
" ファイルに変更があった場合に､｢+｣､｢-｣ で表示
Plug 'airblade/vim-gitgutter'

"--------------
" Git関連
"--------------
" リポジトリビューア
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

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'

" vim-json
Plug 'elzr/vim-json'

" Qfixhowm
Plug 'fuenor/qfixhowm'

" todo.txt-vim
Plug 'dbeniamine/todo.txt-vim'

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
