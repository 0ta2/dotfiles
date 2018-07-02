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
  let howm_dir = '~/.ghq/gitlab.com/0ta2/howm'
  " 休日定義ファイル定義
  let QFixHowm_HolidayFile = '~/.vim/plugged/qfixhowm/misc/holiday/Sche-Hd-0000-00-00-000000.utf8'
elseif has("unix")
  " unix用設定
elseif has("win64")
  " 64bit_windows用設定
  let howm_dir = 'C:\Dev\howm'
  let QFixHowm_HolidayFile = 'C:\Dev\Git\qfixhowm\misc\holiday\Sche-Hd-0000-00-00-000000.utf8'
endif

let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.md'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'dos'

" 外部grep 設定
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" ripgrepを使う（PATHは通してある前提）
let mygrepprg = 'rg'
let myjpgrepprg = 'rg'
" マルチエンコーディングgrepを使用する
let MyGrep_MultiEncoding = 1
" マルチエンコーディングgrepで使用するエンコーディングリスト
let MyGrep_MultiEncodingList = ['utf-8', 'cp932']
" 外部grep(shell)のエンコーディング(Windows)
let MyGrep_ShellEncoding = 'utf-8'
" 実行時のオプションをripgrep用に変更（GNU Grepと同じ出力になるように）
let MyGrepcmd_useropt='-nH --no-heading --color never'
let MyGrepcmd_regexp=''
let MyGrepcmd_regexp_ignore='-i'
let MyGrepcmd_fix='-F'
let MyGrepcmd_fix_ignore='-F -i'
let MyGrepcmd_recursive=''
" gipgrepにファイルパターンとして「*」「*.*」を渡したらエラーになったのでその対策
let MyGrep_GrepFilePattern='.'

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

"Quickfixウィンドウの高さ
let QFix_Height = 10

set shellslash

" textwidthの再設定
au Filetype qfix_memo setlocal textwidth=0

" オートリンクでファイルを開く
let QFixHowm_Wiki = 1

"--------------
" MRUリスト設定
"--------------
" MRU表示数
let QFixMRU_Entries      = 30
" MRUの保存ファイル名
let QFixMRU_Filename     = '~/.qfixmru'

" MRU内部のエントリ最大保持数
let QFixMRU_EntryMax     = 300
