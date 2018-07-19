"--------------
" https://sites.google.com/site/fudist/Home/qfixhowm/install
"--------------
"--------------
" Basic Settings
"--------------
" キーマップリーダー
let QFixHowm_Key = ''
" キーマップ(2ストローク目)
let QFixHowm_KeyB = ','

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

" メモファイルのファイル名
let howm_filename          = "%Y/%m/%Y-%m-%d-%H%M%S.md"
" メモファイルのエンコーディング
let howm_fileencoding      = 'utf-8'
" メモファイルの改行コード
let howm_fileformat        = 'unix'
" ファイルタイプ指定
let QFixHowm_FileType = 'markdown'

"--------------
" Keymap Settings
"--------------
nnoremap <silent><Leader>w :call QFixToggleWin()<CR>

"--------------
" QuickFix Settings
"--------------
" Quickfixのプレビューや絞込み処理制御
" 0 : なにもしない
" 1 : QuickFix/ロケーションリストの両方で有効
" 2 : ロケーションリストのみ有効
" 3 : QFixMemo/QFixGrepコマンドで開いた場合のみ有効
let QFixWin_EnableMode = 1

" プレビューを有効にする
let QFix_PreviewEnable = 1

"Quickfixウィンドウの高さ
let QFix_Height = 10

" QuickFixウィンドウの幅
let QFix_Width = 0
" QuickFixウィンドウの開き方
" vertical botright で 横に表示する
let QFix_CopenCmd = ''
" QuickFixウィンドウでカーソルラインを表示
let QFix_CursorLine = 1
" カレントウィンドウの最低幅(Vim設定値)
set winwidth=20
" QuickFixウィンドウのプレビューでfiletype別のハイライトを有効にする
let QFix_PreviewFtypeHighlight = 1

" QuickFixウィンドウから開いた後ウィンドウを閉じる
let QFix_CloseOnJump = 0
" QuickFixウィンドウの <S-CR> は分割ではなくタブで開くには 'tab'に設定する
let QFix_Edit = ''
" QFixHowm/QFixGrepの結果表示にロケーションリストを使用する
let QFix_UseLocationList = 1

"--------------
" Preview Window Settings
"--------------
" プレビュー対象外ファイルの指定
let QFix_PreviewExclude = '\.pdf$\|\.mp3$\|\.jpg$\|\.bmp$\|\.png$\|\.zip$\|\.rar$\|\.exe$\|\.dll$\|\.lnk$'
" プレビューウィンドウの高さ(previewheightを使用したくない場合のみ指定)
let QFix_PreviewHeight = 12
" プレビューウィンドウの幅
let QFix_PreviewWidth  = 0
" プレビューウィンドウの開き方指定
let QFix_PreviewOpenCmd = ''
" プレビュー画面のカーソルラインを表示
let QFix_PreviewCursorLine = 1
" プレビューウィンドウの折り返し表示
let QFix_PreviewWrap = 1

"--------------
" Grep Settings
"--------------
" Grepコマンドのキーマップ
" Grepコマンドの2ストローク目キーマップ
let MyGrep_KeyB = ','

" grep対象にしたくないファイル名の正規表現
let MyGrep_ExcludeReg = '[~#]$\|\.dll$\|\.exe$\|\.lnk$\|\.o$\|\.obj$\|\.pdf$\|\.xls$'

" 外部grep 設定
if executable('rg')
  " ripgrepを使う（PATHは通してある前提）
  let mygrepprg = 'rg'
  " 日本語が含まれる場合のgrep指定
  let myjpgrepprg = 'rg'
  " マルチエンコーディングgrepを使用する
  let MyGrep_MultiEncoding = 1
  " マルチエンコーディングgrepで使用するエンコーディングリスト
  let MyGrep_MultiEncodingList = ['utf-8', 'cp932']
  " 外部grep(shell)のエンコーディング(Windows)
  " 実行時のオプションをripgrep用に変更（GNU Grepと同じ出力になるように）
  let MyGrepcmd_useropt='-nH --no-heading --color never'
  let MyGrepcmd_regexp=''
  let MyGrepcmd_regexp_ignore='-i'
  let MyGrepcmd_fix='-F'
  let MyGrepcmd_fix_ignore='-F -i'
  let MyGrepcmd_recursive=''
  " gipgrepにファイルパターンとして「*」「*.*」を渡したらエラーになったのでその対策
  let MyGrep_GrepFilePattern='.'
endif

" 外部grep(shell)のエンコーディング(Unix)
let MyGrep_ShellEncoding = 'utf-8'
" 外部grepで検索結果のエンコーディング変換が行われる場合のエンコーディング指定
" (通常はMyGrep_ShellEncodingと同一のため設定しないでください)
let MyGrep_FileEncoding = ''

" 検索ディレクトリはカレントディレクトリを基点にする
" 0なら現在開いているファイルの存在するディレクトリを基点
let MyGrep_CurrentDirMode = 1

" 「だめ文字」対策を有効/無効
let MyGrep_Damemoji = 2
" 「だめ文字」を置き換える正規表現
let MyGrep_DamemojiReplaceReg = '(..)'
" 「だめ文字」を自分で追加指定したい場合は正規表現で指定する
let MyGrep_DamemojiReplace = '[]'

" QFixGrepの検索時にカーソル位置の単語を拾う/拾わない
let MyGrep_DefaultSearchWord = 1

"--------------
" File/Template Settings
"--------------
" クイックメモファイル
let QFixHowm_QuickMemoFile = 'Qmem-00-0000-00-00-000000.txt'
" 日記メモファイル
let QFixHowm_DiaryFile     = '%Y/%m/%Y-%m-%d-000000.txt'
" ペアファイル保存場所
let QFixHowm_PairLinkDir   = 'pairlink'
" キーワード保存ファイル
let QFixHowm_keywordfile   = '~/.howm-keys'

" タイトル記号
let QFixHowm_Title = '#'
" テンプレート
let QFixHowm_Template = [
  \ "# %TAG%",
  \ "%DATE%",
  \ ""
\]

" テンプレート(カーソル移動)
" ノーマルモードのコマンドがそのまま使用可能、最後が i なら i、 $a なら A コマンドと同様の動作になる
let QFixHowm_Cmd_NewEntry = "$a"
" テンプレートに挿入されるタグ
let QFixHowm_DefaultTag   = '[.]'

"--------------
" Window Settings
"--------------
" スプリットで開く
let QFixHowm_SplitMode = 0
" タブ編集モード('tab'を設定)
let QFixHowm_Edit      = ''
" QFixList表示でファイルへ移動したらウィンドウを閉じる
let QFixHowm_ListCloseOnJump = 0

"--------------
" Misc Settings
"--------------
" 最近更新ファイル検索日数
let QFixHowm_RecentDays = 14
"全エントリ一覧表示でキャッシュを使用する「エントリ一覧(キャッシュ)」
let QFixHowm_TitleListCache = 1

" howmファイルの自動整形を使用する
let QFixHowm_Autoformat = 1
" オートタイトル文字数
let QFixHowm_Replace_Title_Len = 64
" 更新時間管理モード
let QFixHowm_RecentMode = 0
" 更新時間を埋め込む
let QFixHowm_SaveTime   = 0
" ファイル読込の際に、ファイルエンコーディングを強制する
let QFixHowm_ForceEncoding = 1
" 検索時にカーソル位置の単語を拾う
let QFixHowm_DefaultSearchWord = 1
" 一括ファイルリネームに使用する文字数
let QFixHowm_FilenameLen = 17

"--------------
" Switch Action Settings
"--------------
" リストスイッチアクション
let QFixHowm_SwitchListActionLock  = ['{ }', '{-}', '{*}', '{_}']
" ユーザースイッチアクション
"let QFixHowm_UserSwActionLock      = ''

"--------------
" keyword Link Settings
"--------------
" Wikiスタイルリンクはgrepせずに対応ファイルを開く
let QFixHowm_Wiki    = 0
" Wikiスタイルリンクは対応ファイルを開く場合の保存ディレクトリ
let QFixHowm_WikiDir = ''

"--------------
" Outline Mode Settings
"--------------
" 折りたたみ設定
" 0 : 折りたたみを無効にする
" 1 : 折りたたみを有効にする。
" 2 : タイトルは折り畳まない
let QFixHowm_Folding               = 2
" チャプターのレベルに応じた折りたたみを設定する
let QFixHowm_FoldingMode           = 1
" 折りたたみのパターン
let QFixHowm_FoldingPattern        = '^\([=#.]\+\s\|\(\d\+\|\*\)\.\)'
" 折りたたみにチャプターのタイトル行を含める/含めない
let QFixHowm_FoldingChapterTitle   = 1
" 折りたたみに ワイルドカードチャプターを使用する
let QFixHowm_WildCardChapter       = 0
" 階層付きテキストもワイルドカードチャプター変換の対象にする
let QFixHowm_WildCardChapterMode   = 1

"--------------
" Menu Settings
"--------------
" メニューファイルディレクトリ
let QFixHowm_MenuDir               = ''
" メニューファイル
let QFixHowm_Menufile              = 'Menu-00-00-000000.howm'

" メニュー画面にカレンダーも表示する
let QFixHowm_MenuCalendar          = 1
" メニュー画面に表示する MRUリストのエントリ数
let QFixHowm_MenuRecent            = 5
" メニュー画面はwrapする
let QFixHowm_MenuWrap              = 0
" メニュー画面では常にプレビューウィンドウ表示
let QFixHowm_MenuPreview           = 1
" メニュー画面のプレビュー有効/無効
let QFixHowm_MenuPreviewEnable     = 0
" メニュー画面からファイルへ移動したらウィンドウを閉じる
let QFixHowm_MenuCloseOnJump       = 1
" メニュー画面でホットキーを使用する
let QFixHowm_MenuKey               = 1

" メニュー画面の分割方法指定
let QFixHowm_MenuCmd               = 'vertical split'
" メニュー画面の高さ指定
let QFixHowm_MenuHeight            = 0
" メニュー画面の高さ指定モード
let QFixHowm_MenuHeightMode        = 0
" メニュー画面の横幅指定
let QFixHowm_MenuWidth             = 0

"--------------
" Calendar/Submenu Settings
"--------------
" カレンダー表示コマンド(vertical topleft, vertical botright)
let QFixHowm_CalendarWinCmd = 'vertical topleft'
" カレンダーに表示する月数
let QFixHowm_CalendarCount  = 3
" カレンダーの日本語表示($LANG='ja'ならデフォルトは2)
let caledar_jp              = 2
" カレンダー休日定義ファイル(通常は自動設定)
let calendar_holidayfile    = ''

"サブメニューのファイル名
let SubWindow_Title         = '__work__'
"サブメニューを出す方向
let SubWindow_Direction     = "topleft vertical"
"サブメニューのサイズ
let SubWindow_Size          = 50
"サブメニューのwrap
let SubWindow_Wrap          = 1
" サブメニューで表示するカレンダーの分割指定(leftabove, rightbelow, または空文字列)
let SubWindow_CalendarWinCmd = ''

" 画面上のサブメニューはひとつだけ
let SubWindow_SingleMode     = 0

"--------------
" Entry Random View
"--------------
"ランダム表示保存ファイル
let QFixHowm_RandomWalkFile    = '~/.howm-random'
"ランダム表示数
let QFixHowm_RandomWalkColumns = 10
"ランダム表示保存ファイル更新間隔(日数)
let QFixHowm_RandomWalkUpdate  = 2
"ランダム表示対象外の正規表現
let QFixHowm_RandomWalkExclude = ''

"--------------
" Auto Todo Check
"--------------
" 起動時にコマンド実行
let QFixHowm_VimEnterCmd  = 'y'
" 起動時コマンドメッセージ
let QFixHowm_VimEnterMsg  = 'Todo check!!'
" 起動時コマンド基準時間
let QFixHowm_VimEnterTime = '09:00'
" 起動時間チェック用ファイル
let QFixHowm_VimEnterFile = '~/.vimenter.qf'

"--------------
" MRU Settings
"--------------
" MRU表示数
let QFixMRU_Entries      = 50
" MRUの保存ファイル名
let QFixMRU_Filename     = '~/.qfixmru'

" MRUに登録しないファイル名(正規表現)
let QFixMRU_IgnoreFile   = ''
" MRUに登録するファイルの正規表現(設定すると指定ファイル以外登録されない)
let QFixMRU_RegisterFile = ''
" MRUに登録しないタイトル(正規表現)
let QFixMRU_IgnoreTitle  = ''

" MRU内部のエントリ最大保持数
let QFixMRU_EntryMax     = 500

"--------------
" Todo Settings
"--------------
" タイムスタンプフォーマット
let QFixHowm_DatePattern              = '%Y-%m-%d'
" 予定・TODOを検索するディレクトリ
let QFixHowm_ScheduleSearchDir        = ''
" 予定・TODOのキャッシュを保持する時間(5分)
let QFixHowm_ListReminderCacheTime    = 5*60

" 予定やTODOのデフォルト値
" @ 予定
let QFixHowm_ReminderDefault_Schedule = 0
" ! 締切
let QFixHowm_ReminderDefault_Deadline = 7
" - リマインダー
let QFixHowm_ReminderDefault_Reminder = 1
" + Todo
let QFixHowm_ReminderDefault_Todo     = 7
" ~ 浮沈Todo
let QFixHowm_ReminderDefault_UD       = 30

" ,y で表示する予定・TODO
let QFixHowm_ListReminder_ScheExt     = '[-@+!~]'
" ,t で表示する予定・TODO
let QFixHowm_ListReminder_TodoExt     = '[-@+!~.]'
" メニューで表示する予定・TODO
let QFixHowm_ListReminder_MenuExt     = '[-@+!~.]'
" 予定・TODOの同一日、同一種類のソート正順/逆順
let QFixHowm_ReminderSortMode         = 1
" 予定・TODOのソート優先順
let QFixHowm_ReminderPriority         = {'@' : 1, '!' : 2, '+' : 3, '-' : 4, '~' : 5, '.' : 6}

" ,y の予定表示日数
let QFixHowm_ShowSchedule             = 30
" ,t の予定表示日数
let QFixHowm_ShowScheduleTodo         = -1
" メニューの予定表示日数
let QFixHowm_ShowScheduleMenu         = 14
" 終了日指定のオフセット
let QFixHowm_EndDateOffset            = 0
" リマインダの継続期間のオフセット
let QFixHowm_ReminderOffset           = 0
" 予定やTodoのプライオリティレベルが、これ未満のエントリは削除する
let QFixHowm_RemovePriority           = 0
" 予定やTodoのプライオリティレベルが、今日よりこれ以下なら削除する。
let QFixHowm_RemovePriorityDays       = 100

" 休日定義ファイル
let QFixHowm_HolidayFile              = 'Sche-Hd-0000-00-00-000000.*'
" 休日名
let QFixHowm_ReminderHolidayName      = '元日\|成人の日\|建国記念の日\|昭和の日\|憲法記念日\|みどりの日\|こどもの日\|海の日\|敬老の日\|体育の日\|文化の日\|勤労感謝の日\|天皇誕生日\|春分の日\|秋分の日\|振替休日\|国民の休日\|日曜日'
" ユーザー定義の休日
"let QFixHowm_UserHolidayName          = ''
" ユーザー定義の強調表示日
"let QFixHowm_UserSpecialdayName       = ''

" 今日の日付/時刻表示行の表示指定
let QFixHowm_ShowTodayLine            = 3
" 今日の時刻表示行のタイプ指定
let QFixHowm_TodayLineType            = '@'
" 曜日表示を日本語にする
let QFixHowm_JpDayOfWeek              = 1

" GMTとの時差
let QFixHowm_ST                       = -9
" 同一日、同一内容の予定・TODOは一つにまとめる
let QFixHowm_RemoveSameSchedule       = 1
" 予定・TODOでプレビュー表示を有効にする
let QFixHowm_SchedulePreview          = 0
