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


"------------------
" coc-yank
"------------------
nnoremap <silent> <Leader>y  :<C-u>CocList -A --normal yank<CR>

"------------------
" coc-git
"------------------
nnoremap <silent> <Leader>g  :<C-u>CocList --normal gstatus<CR>
