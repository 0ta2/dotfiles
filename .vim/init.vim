"--------------
" vim-plug
"--------------
call plug#begin('~/.vim/plugged')

"--------------
" Other
"--------------
" helpの日本語訳
Plug 'vim-jp/vimdoc-ja'

" 起動時の表示画面変更
Plug 'mhinz/vim-startify'

" 移動強化
Plug 'easymotion/vim-easymotion'

" 整形
Plug 'junegunn/vim-easy-align'

" 画面分割した際のサイズ変更を便利にする
Plug 'kana/vim-submode'

" シンタックチェック
Plug 'w0rp/ale'
" gtacs
Plug 'jsfaint/gen_tags.vim'

" cheatsheet
Plug 'reireias/vim-cheatsheet'

" 文字列検索
Plug 'osyo-manga/vim-anzu'

" 16進数の色を表示する
Plug 'gko/vim-coloresque'

Plug 'liuchengxu/vista.vim'

"--------------
" tab/buffer関連
"--------------
" Buffer の表示/可視化
Plug 'ap/vim-buftabline'

"--------------
" 移動系
"--------------
" 対応するカッコへの移動
Plug 'andymass/vim-matchup'

"--------------
" Vim Color
"--------------
" vimのカラー設定
"Plug 'cocopon/iceberg.vim'
"Plug 'arcticicestudio/nord-vim'
Plug 'w0ng/vim-hybrid'

"--------------
" ファイルツリー関連
"--------------
" ファイルツリーを表示
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" スクリプトの構造表示(universal-ctagsが必須)
Plug 'majutsushi/tagbar'

"--------------
" ファイル関連
"--------------
" ファイルにあるに末尾にあるスペースを可視化
Plug 'bronson/vim-trailing-whitespace'

" ファイル検索
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" json の表示
Plug 'elzr/vim-json'

"--------------
" undo関連
"--------------
Plug 'mbbill/undotree'

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
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" coc exstensions
Plug 'neoclide/coc-sources', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
" 対応するカッコの自動入力
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}

" コメントアウト
Plug 'tpope/vim-commentary'

" 括弧を簡単にできるようにする
Plug 'tpope/vim-surround'

"--------------
" スニペット関連
"--------------
Plug 'honza/vim-snippets'

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
