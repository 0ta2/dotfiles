"--------------
" coc.nvim
"--------------
  " use <tab> for trigger completion and navigate to the next complete item
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " Remap keys for gotos
  nmap <silent> <Leader>gd <Plug>(coc-definition)
  nmap <silent> <Leader>gy <Plug>(coc-type-definition)
  nmap <silent> <Leader>gi <Plug>(coc-implementation)
  nmap <silent> <Leader>gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

"--------------
" coc-yank
"--------------
nnoremap <silent><Leader>y :<C-u>CocList -A --normal yank<CR>

"--------------
" coc-snippets
"--------------
  " Use <C-l> for trigger snippet expand.
  imap <C-l> <Plug>(coc-snippets-expand)

  " Use <C-j> for select text for visual placeholder of snippet.
  vmap <C-j> <Plug>(coc-snippets-select)

  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'

  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'

  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-j> <Plug>(coc-snippets-expand-jump)

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  let g:coc_snippet_next = '<tab>'

"--------------
" coc-explorer
"--------------
  " Open explorer.
  nmap <space>e :CocCommand explorer<CR>

"--------------
" coc-prettier
"--------------
  command! -nargs=0 Prettier :CocCommand prettier.formatFile

"--------------
" coc-vimlsp
"--------------
  let g:markdown_fenced_languages = [
    \ 'vim',
    \ 'help'
  \]

"--------------
" coc-actions
"--------------
  " Remap for do codeAction of selected region
  function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
  endfunction
  xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
  nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

"--------------
" fzf
"--------------
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

"--------------
" coc-clap
"--------------
  nnoremap <silent><Leader>c :Clap coc_commands<CR>
  nnoremap <silent><Leader>b :Clap buffers<CR>
  nnoremap <silent><Leader>d :Clap coc_diagnostics<CR>

"--------------
" vim-clap
"--------------
  " Clap List
  nnoremap <silent><Leader>l :Clap<CR>
  " Fuzzy search option"
  let g:clap_provider_grep_opts = '--hidden -g "!.git/"'
  " File fuzzy search.
  nnoremap <silent><Leader>f :Clap files --hidden<CR>

"--------------
" ale.vim
"--------------
  " 表示関連の設定
  let g:ale_sign_error = ''
  let g:ale_sign_warning = ''

  " fixers
  let g:ale_fixers = {
        \ '*': ['remove_trailing_lines', 'trim_whitespace'],
        \ 'php': ['php_cs_fixer'],
        \ 'go': ['goff'],
        \ 'json': ['fixjson', 'jq'],
        \ 'markdown': ['prettier'],
        \ 'python': ['autopep8', 'yapf']
  \}

  " linter
  let g:ale_linters = {
  	    \ 'go': ['gopls'],
  \}

  " Set this. Airline will handle the rest.
  let g:airline#extensions#ale#enabled = 1




