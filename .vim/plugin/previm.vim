" ブラウザを指定
let g:previm_open_cmd = '/usr/bin/chromium-browser'

" markdown と拡張子を紐付ける
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
