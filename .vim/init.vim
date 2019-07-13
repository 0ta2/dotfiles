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
" 起動時の表示画面変更
Plug 'mhinz/vim-startify'
" 移動強化
Plug 'easymotion/vim-easymotion'
" 整形
" command: ga
Plug 'junegunn/vim-easy-align'
" 画面分割した際のサイズ変更を便利にする
Plug 'kana/vim-submode'
" シンタックチェック
Plug 'w0rp/ale'
" buffer の表示
" Buffer の可視化
Plug 'ap/vim-buftabline'
" gtacs
Plug 'jsfaint/gen_tags.vim'
" QFixHowm
Plug 'fuenor/qfixhowm'
" cheatsheet
Plug 'reireias/vim-cheatsheet'
" 文字列検索
Plug 'osyo-manga/vim-anzu'
" 16進数の色を表示する
Plug 'gko/vim-coloresque'

"--------------
" ファイルツリー関連
"--------------
" ファイルツリーを表示
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" タブ毎に変わっていまうツリー状態をタブ間で共有
Plug 'jistr/vim-nerdtree-tabs'
" ファイルに変更があた場合に、ツリーに表示
Plug 'Xuyuanp/nerdtree-git-plugin'
" NERDtree にファイルタイプごとにアイコンを表示
Plug 'ryanoasis/vim-devicons'

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

" json の表示
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
" Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" Pythonの補完
" Plug 'deoplete-plugins/deoplete-jedi'
Plug 'ryanolsonx/vim-lsp-python'

" 対応する括弧を入力
Plug 'kana/vim-smartinput'

" 言語パック(syntac/indent)
Plug 'sheerun/vim-polyglot'

" vim-lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'        " vim-lsp を使うために必要
Plug 'lighttiger2505/deoplete-vim-lsp' " deoplete-vim で vim-lsp を使えるようにする

" PHP Lunguage Server
Plug 'felixfbecker/php-language-server', {'do': 'composer install && composer run-script parse-stubs'}

" コメントアウト
Plug 'tpope/vim-commentary'

" 括弧を簡単にできるようにする
Plug 'tpope/vim-surround'

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
Plug 'godlygeek/tabular'      " Markdownの表整形に必要
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'

"--------------
" Tmux関連
"--------------
" Tmux のpain移動とvimの分割画面の移動をシームレスに行う
Plug 'christoomey/vim-tmux-navigator'

"--------------
" Window関連
"--------------
Plug 'simeji/winresizer'

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
set runtimepath+=$HOME/.vim/plugged/qfixhowm