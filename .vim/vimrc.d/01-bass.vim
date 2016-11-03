"----------------------------------
"" 基本設定
"----------------------------------

" 文字コード指定
set encoding=utf-8

" 読み込む文字エンコードを指定
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" クリイプボード共有
set clipboard+=unnamed,autoselect

" swpファイルの保存場所
set directory=~/.vim/tmp

" バックアップフィアルの出力先
set backupdir=~/.vim/tmp

" viminfoファイルの出力先
set viminfo+=n$HOME/viminfo.txt

" undofileの出力先 .un~
set undodir=~/.vim/tmp

" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible

" 構文ハイライトを有効化
syntax enable

" カラーテーマを指定
" japanesque
" molokai
" lucario
" hybrid (set background=dark)
colorscheme hybrid
set background=dark

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" コマンドライン補完を便利に
set wildmode=longest,full

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" オートインデント、改行、インサートモード開始直後にバックスペースキーで削除できるようにする。
set backspace=indent,eol,start

" カーソルが何行目の何列目に置かれているかを表示する。(有効:ruler/無効:noruler)
set ruler

" 最下ウィンドウにいつステータス行が表示されるかを設定する。
" 0: 全く表示しない
" 1: ウィンドウの数が2以上のときのみ表示
" 2: 常に表示
set laststatus=2

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存するかどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" ビジュアルベルも無効化する
set t_vb=

" マウスを有効化
" n: ノーマルモードで有効
" v: ビジュアルモードで有効
" i: 挿入モードで有効
" c: コマンドラインモードで有効
" a: 全モードでマウスを有効化
set mouse=a

" コマンドラインに使われる画面上の行数
set cmdheight=2

" 毎行の前に行番号を表示する。(有効:number/無効:nonumber)
set number

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout       " マッピングについてタイムアウトしない
set ttimeout        " 端末のキーコードについてタイムアウトする
set ttimeoutlen=100 " 100 ミリ秒後にタイムアウトする

" 横線を表示
set cursorline
" アンダーラインを引く
" cterm  : カラー端末での属性
" ctermfg: カラー端末での文字色
" ctermbg: カラー端末での背景色
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

" 縦線の表示
set cursorcolumn
" 縦に線を引く
" cterm  : カラー端末での属性
" ctermfg: カラー端末での文字色
" ctermbg: カラー端末での背景色
highlight CursorColumn ctermfg=NONE ctermbg=darkblue

"---------------------------
" インデント関連のオプション
"---------------------------
" オートインデント
set autoindent

" タブ文字の代わりにスペースを使う(有効:expandtab/noexpandtab)
set expandtab
set tabstop=2     " <TAB>を含むファイルを開いた際、<TAB>を何文字の空白に変換するかを設定
set softtabstop=2 " キーボードで<TAB>を入力した際、<TAB>を何文字の空白に変換するかを設定
set shiftwidth=2  " vimが自動でインデントを行った際、設定する空白数

"---------------------------
" 検索関連のオプション
"---------------------------
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch

" 検索語を強調表示
set hlsearch

" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が混在しているときは区別する
set ignorecase
set smartcase
