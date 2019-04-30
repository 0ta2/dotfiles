"--------------
" vim-plug
"--------------
call plug#begin('~/.vim/plugged')

"--------------
" Other
"--------------
" helpの日本語訳
Plug 'vim-jp/vimdoc-ja'
" vimのカラー設定
Plug 'cocopon/iceberg.vim'
" jk 高速移動
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

" インデントの深さの可視化
Plug 'nathanaelkane/vim-indent-guides'

" ファイルにあるに末尾にあるスペースを可視化
Plug 'bronson/vim-trailing-whitespace'

" ファイル検索
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'elzr/vim-json'

"--------------
" Git関連
"--------------
" リポジトリビューア
Plug 'cohama/agit.vim'
" Git 操作
Plug 'tpope/vim-fugitive'

"--------------
" 補完関連
"--------------
" 補完フレームワーク
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" PHP補完
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
" Python補完
Plug 'deoplete-plugins/deoplete-jedi'
" 対応する括弧を入力
Plug 'kana/vim-smartinput'

"--------------
" スニペット関連
"--------------
" default スニペット
Plug 'Shougo/neosnippet-snippets'
" 独自スニペット
Plug 'Shougo/neosnippet'

"--------------
" Markdown関連
"--------------
" markdown
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'

call plug#end()

" OS判定
let OSTYPE = system('uname')

"--------------
" Load vim files
"--------------
runtime! vimrc.d/*.vim
