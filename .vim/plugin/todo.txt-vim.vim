" Use todo#Complete as the omni complete function for todo files
au filetype todo setlocal omnifunc=todo#Complete

" + @ で自動補完するようにする
au filetype todo imap <buffer> + +<C-X><C-O>
au filetype todo imap <buffer> @ @<C-X><C-O>

" 補完時にプレビューウインドウを表示させないようにする
au filetype todo setlocal completeopt-=preview
