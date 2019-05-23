call denite#custom#option('default', 'prompt', '>') " # で表示されるものを > へ変更
call denite#custom#var('file/rec', 'command',
    \ ['rg', '--files', '--glob', '!.git'])

" C-t でタブで開く
call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')

" C-v で vsplit
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')

" v で vsplit
call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')

" 除外ファイル指定
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
	      \ [ '.git/', '.ropeproject/', '__pycache__/',
	      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
