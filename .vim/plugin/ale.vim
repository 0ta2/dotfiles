"------------------
" ale.vim
"------------------
" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
" 保存時に整形
let g:ale_fix_on_save = 1

" 表示関連の設定
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass

" remove_trailing_lines 末尾の行を削除
" trim_whitespace 各行にある末尾の空白を削除
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'php': ['php_cs_fixer'],
      \ 'go': ['gofmt']
      \}

" linter を設定
let g:ale_linters = {
	    \ 'go': ['gopls'],
	    \}
