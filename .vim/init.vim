"--------------
" vim-plug
"--------------
call plug#begin('~/.vim/plugged')
" coc
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  let g:coc_global_extensions = [
    \ 'coc-snippets'
    \, 'coc-explorer'
    \, 'coc-prettier'
    \, 'coc-phpls'
    \, 'coc-html'
    \, 'coc-css'
    \, 'coc-yaml'
    \, 'coc-pairs'
    \, 'coc-vimlsp'
    \, 'coc-markdownlint'
    \, 'coc-yank'
    \, 'coc-sh'
    \, 'coc-actions'
    \, 'coc-docker'
    \, 'coc-spell-checker'
    \, 'coc-lists'
    \, 'coc-json'
    \, 'coc-dictionary'
    \, 'coc-word'
    \, 'coc-emoji'
    \, 'coc-syntax'
    \, 'coc-bookmark'
    \, 'coc-bootstrap-classname'
    \, 'coc-zi'
    \, 'coc-tsserver'
    \, 'coc-vetur'
    \, 'coc-fzf-preview'
  \ ]

" Dev
  Plug 'tpope/vim-commentary'       " コメントアウト
  Plug 'dense-analysis/ale'         " シンタックスチェック
  Plug 'sheerun/vim-polyglot'       " 各言語の設定パック
  Plug 'liuchengxu/vista.vim'       " ナビゲーター
  Plug 'honza/vim-snippets'         " スニペット

" Git
  Plug 'tpope/vim-fugitive'       " Vim からGit操作
  Plug 'airblade/vim-gitgutter'   " 変更点を行番号に表示
  Plug 'tpope/vim-rhubarb'        " GitのURLアクセス

" fzf
  Plug '/usr/local/opt/fzf'       " Homebrew でインストールした、fzf を使用
  Plug 'junegunn/fzf.vim'         " Vim から fzf を使用

" Status ber
  Plug 'vim-airline/vim-airline'        " ステータスバーの拡張
  Plug 'vim-airline/vim-airline-themes' " ステータスバーのカラーテーマ

" tmux
  Plug 'christoomey/vim-tmux-navigator' " tmuxとの連携強化

" move
  Plug 'easymotion/vim-easymotion'      " vim移動拡張
  Plug 'andymass/vim-matchup'           " 対応するカッコに移動強化

" display
  Plug 'nathanaelkane/vim-indent-guides'  " インデント可視化
  Plug 'bronson/vim-trailing-whitespace'  " 末尾にあるスペースを可視化
  Plug 'simeji/winresizer'                " 分割のリサイズ
  Plug 'previm/previm'                    " markdown preview

" cursor
  Plug 'terryma/vim-multiple-cursors'   " カーソル操作

" Search
  Plug 'osyo-manga/vim-anzu'            " 検索位置表示
  Plug 'markonm/traces.vim'             " 置換結果プレビュー

" buffer
  Plug 'ap/vim-buftabline'              " bufferのタブ表示

" Color
  Plug 'morhetz/gruvbox'
  Plug 'rakr/vim-one'
  Plug 'cocopon/iceberg.vim'
  Plug 'gkeep/iceberg-dark'
  Plug 'NLKNguyen/papercolor-theme'

" Other
  Plug 'tpope/vim-surround'             " カッコの編集
  Plug 'mhinz/vim-startify'             " ダッシュボード
  Plug 'vim-jp/vimdoc-ja'               " help の日本語化
  Plug 'reireias/vim-cheatsheet'        " チャートシート
  Plug 'gko/vim-coloresque'             " カラープレビュー
  Plug 'ryanoasis/vim-devicons'         " アイコン
  Plug 'Gelguy/wilder.nvim'

call plug#end()

"--------------
" Load vim files
" let g:fugitive_browse_handlers
"--------------
runtime! vimrc.d/*.vim
