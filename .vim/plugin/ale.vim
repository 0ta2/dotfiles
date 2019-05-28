" PHP のシンタックチェック
let g:ale_fixers = {}
let g:ale_fixers['php'] = ['php_cs_fixer']
" 保存時に整形
let g:ale_fix_on_save = 1
