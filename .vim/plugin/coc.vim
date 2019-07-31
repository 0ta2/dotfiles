"------------------
" coc.vim
"------------------
nnoremap <Leader>c :CocCommand<CR>
nnoremap <Leader>l :CocList<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Remap keys for gotos
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

"------------------
" coc-yank
"------------------
nnoremap <silent> <Leader>y  :<C-u>CocList -A --normal yank<CR>

"------------------
" coc-git
"------------------
nmap <Leader>gs <Plug>(coc-git-chunkinfo)
nmap <Leader>gc <Plug>(coc-git-commit)

"------------------
" coc-snippets
"------------------
