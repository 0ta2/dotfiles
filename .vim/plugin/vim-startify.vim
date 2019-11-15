" vim-startify
" vim-startify で開くときに、そのディレクトリに移動する
let g:startify_change_to_dir = 1

" git ディレクトリを開く場合は、トップディレクトリに移動する
let g:startify_change_to_vcs_root = 1

" empty buffer や quit を表示する
let g:startify_enable_special = 1

" 最初に表示する内容を記載する。
let g:startify_lists = [
       \ { 'type': 'files',     'header': ['   最近使ったファイル'] },
       \ { 'type': 'dir',       'header': ['   カレントディレクトリ配下で最近使ったファイル'. getcwd()] },
       \ { 'type': 'sessions',  'header': ['   セッション']       },
       \ { 'type': 'bookmarks', 'header': ['   ブックマーク']      },
       \ { 'type': 'commands',  'header': ['   Commands']       },
       \ ]

" 起動時のログを指定
let g:startify_custom_header = [
      \ '  ___      ___ ___  _____ ______',
      \ ' |\  \    /  /|\  \|\   _ \  _   \',
      \ ' \ \  \  /  / | \  \ \  \\\__\ \  \',
      \ '  \ \  \/  / / \ \  \ \  \\|__| \  \',
      \ '   \ \    / /   \ \  \ \  \    \ \  \',
      \ '    \ \__/ /     \ \__\ \__\    \ \__\',
      \ '     \|__|/       \|__|\|__|     \|__|',
      \ ]
