"----------------------------------
"" 基本設定
"----------------------------------
" 文字コード指定
set encoding=utf-8

" 読み込む文字エンコードを指定
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" クリイプボード共有
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard+=unnamed
endif

" tmux のClipboardを共有
let g:clipboard = {
          \   'name': 'myClipboard',
          \   'copy': {
          \      '+': 'tmux load-buffer -',
          \      '*': 'tmux load-buffer -',
          \    },
          \   'paste': {
          \      '+': 'tmux save-buffer -',
          \      '*': 'tmux save-buffer -',
          \   },
          \   'cache_enabled': 1,
          \ }

" swpファイルの保存場所
set directory=~/.vim/tmp

" バックアップフィアルの出力先
set backupdir=~/.vim/tmp

" viminfoファイルの出力先
set viminfo+=n$HOME/viminfo.txt

" undofileの出力先 .un~
set undodir=~/.vim/tmp

" カラーテーマ指定
colorscheme iceberg

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" EXコマンドの補完方法設定
set wildmode=longest,full

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存するかどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル(画面フラッシュ)を使う
set visualbell

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

" □ or ○ の文字があってもコンソール位置がずれないようにする
set ambiwidth=double

" 画面最後の行をできる限り表示する
set display+=lastline

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
