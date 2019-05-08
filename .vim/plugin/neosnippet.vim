" キーマップ設定
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" インサートモード中にTABで選択できるように
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" 選択中にTABで選択できるように
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" snipMate互換機能を有効にする
let g:neosnippet#enable_snipmate_compatibility = 1

" snippetsのディレクトリを指定する
let g:neosnippet#snippets_directory='~/.vim/snippets'
