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
set directory=~/.vim/tmp/swap

" バックアップフィアルの出力先
set backupdir=~/.vim/tmp/backup

" viminfoファイルの出力先
set viminfo+=n$HOME/.vim/tmp/viminfo.txt

" undofileの出力先 .un~
set undofile
set undodir=~/.vim/tmp/undo

" カラーテーマ指定
set background=dark
colorscheme gruvbox

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" EXコマンドの補完方法設定
set wildmode=longest,full

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存するかどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル(画面フラッシュ)を使う
set visualbell

" コマンドラインに使われる画面上の行数(default 1)
set cmdheight=2

" 毎行の前に行番号を表示する。(有効:number/無効:nonumber)
" set number
" 行番号を相対的に表示する。
set relativenumber

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout       " マッピングについてタイムアウトしない
set ttimeout        " 端末のキーコードについてタイムアウトする
set ttimeoutlen=100 " 100 ミリ秒後にタイムアウトする

" 横線を表示
set cursorline

" 縦線の表示
set cursorcolumn

" □ or ○ の文字があってもコンソール位置がずれないようにする
set ambiwidth=double

" 画面最後の行をできる限り表示する
set display+=lastline

" 矩形選択で､矩形の行の行末にテキストがない場合､操作が困難なので回避するための設定
set virtualedit=block

" ctag の設定
set tags+=.git/tags

" ダブルクォーテーションが隠れてしまう問題の対応
set conceallevel=0

" カーソル上下移動のときに位置を維持する
set nostartofline

"---------------------------
" Neovim用 Python設定
" pyenv でインストールしたPATHを指定
"---------------------------
let g:python_host_prog = expand('~/.pyenv/versions/py2neovim/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/py3neovim/bin/python')

"---------------------------
" Neovim用 Ruby設定
" rbenv でインストールしたPATHを指定
"---------------------------
let g:ruby_host_prog = "$HOME/.rbenv/versions/2.6.5/bin/neovim-ruby-host"

"---------------------------
" Neovim用 Node.js設定
" nodenv でインストールしたPATHを指定
"---------------------------
let g:node_host_prog = "$DOTFILES_PATH/node_modules/.bin/neovim-node-host"
let g:node_host_prog = "$HOME/.nodenv/versions/13.1.0/bin/neovim-node-host"

"---------------------------
" インデント関連のオプション
"---------------------------
" タブ文字の代わりにスペースを使う(有効:expandtab/noexpandtab)
set expandtab
" <TAB>を含むファイルを開いた際、<TAB>を何文字の空白に変換するかを設定(default 8)
set tabstop=2
" キーボードで<TAB>を入力した際、<TAB>を何文字の空白に変換するかを設定
set softtabstop=2
" vimが自動でインデントを行った際、設定する空白数(default 8)
set shiftwidth=2

"---------------------------
" 検索関連のオプション
"---------------------------
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch

" 検索語を強調表示
set hlsearch

" 検索時に大文字・小文字を区別しない。
set ignorecase
" 検索後に大文字小文字が混在しているときは区別する
set smartcase
