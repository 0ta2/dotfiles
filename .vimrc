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

"--------------
" ファイルツリー関連
"--------------
" ファイルツリーを表示
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" タブ毎に変わっていまうツリー状態をタブ間で共有
Plug 'jistr/vim-nerdtree-tabs'
" ファイルに変更があた場合に、ツリーに表示
Plug 'Xuyuanp/nerdtree-git-plugin'

" スクリプトの構造表示(universal-ctagsが必須)
Plug 'majutsushi/tagbar'

"--------------
" ファイル関連
"--------------
" ファイルに変更があった場合に､｢+｣､｢-｣ で表示
Plug 'airblade/vim-gitgutter'

" インデントの深さの可視化
Plug 'Yggdroot/indentLine'

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

" filetype の syntaxファイルから補完候補を追加
Plug 'Shougo/neco-syntax'

" Vimスクリプトの補完
Plug 'Shougo/neco-vim'

" PHPの補完
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" Pythonの補完
Plug 'deoplete-plugins/deoplete-jedi'

" 対応する括弧を入力
Plug 'kana/vim-smartinput'

" 言語パック(syntac/indent)
Plug 'sheerun/vim-polyglot'

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
