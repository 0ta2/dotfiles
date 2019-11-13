" vim-startify
" vim-startify で開くときに、そのディレクトリに移動する
let g:startify_change_to_dir = 1
" git ディレクトリを開く場合は、トップディレクトリに移動する
let g:startify_change_to_vcs_root = 1

let g:startify_lists = [
       \ { 'type': 'files',     'header': ['   MRU']            },
       \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
       \ { 'type': 'sessions',  'header': ['   Sessions']       },
       \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
       \ { 'type': 'commands',  'header': ['   Commands']       },
       \ ]

let g:startify_custom_header = [
      \ '  ___      ___ ___  _____ ______       ',
      \ ' |\  \    /  /|\  \|\   _ \  _   \     ',
      \ ' \ \  \  /  / | \  \ \  \\\__\ \  \    ',
      \ '  \ \  \/  / / \ \  \ \  \\|__| \  \   ',
      \ '   \ \    / /   \ \  \ \  \    \ \  \  ',
      \ '    \ \__/ /     \ \__\ \__\    \ \__\ ',
      \ '     \|__|/       \|__|\|__|     \|__| ',
      \ ]
