"--------------
" QFixHomw 設定
" 設定方法の公式ドキュメントは下記
" https://sites.google.com/site/fudist/Home/qfixhowm/install
"--------------

" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
if has("mac")
  " Max用設定
  let howm_dir = '~/Desktop/test/'
elseif has("unix")
    " unix用設定
elseif has("win64")
    " 64bit_windows用設定
endif

let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'dos'

" 外部grep 設定
let mygrepprg = 'ag'

" キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeout timeoutlen=3000 ttimeoutlen=100

" プレビューや絞り込みをQuickFix/ロケーションリストの両方で有効化(デフォルト:2)
let QFixWin_EnableMode = 1

" QFixHowmのファイルタイプ
let QFixHowm_FileType = 'markdown'

" タイトル記号を # に変更
let QFixHowm_Title = '#'

" QuickFixウィンドウでもプレビューや絞り込みを有効化
let QFixWin_EnableMode = 1

" QFixHowm/QFixGrepの結果表示にロケーションリストを使用する
let QFix_UseLocationList = 1

set shellslash

" textwidthの再設定
au Filetype qfix_memo setlocal textwidth=0

" 休日定義ファイル
" 休日定義ファイルは qfixhowm-master 内にあります
let QFixHowm_HolidayFile = '~/.vim/plugged/qfixhowm/misc/holiday/Sche-Hd-0000-00-00-000000.utf8'

" オートリンクでファイルを開く
let QFixHowm_Wiki = 1
