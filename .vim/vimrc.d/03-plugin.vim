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
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

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

  " Remap for CocList"
  nmap <silent><Leader>l :CocList<CR>

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
  " command
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
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

  " buffer jump
  let g:fzf_buffers_jump = 1

  " プロジェクトのトップディレクトリから検索する function
  function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
  endfunction
  command! ProjectFiles execute 'Files' s:find_git_root()
  nnoremap <silent><space>f :<C-u>ProjectFiles<CR>

  " floating window size ratio
  let g:fzf_preview_floating_window_rate = 0.9

"--------------
" coc-fzf-preview
"--------------
  " Remap for fzf-preview
  nmap <Leader>f [fzf-p]
  nnoremap <silent> [fzf-p]p  :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
  nnoremap <silent> [fzf-p]b  :<C-u>CocCommand fzf-preview.Buffers<CR>
  nnoremap <silent> [fzf-p]gs :<C-u>CocCommand fzf-preview.GitStatus<CR>
  nnoremap <silent> [fzf-p]ga :<C-u>CocCommand fzf-preview.GitActions<CR>
  nnoremap          [fzf-p]gr :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
  nnoremap <silent> [fzf-p]q  :<C-u>CocCommand fzf-preview.QuickFix<CR>

"--------------
" coc-fzf
"--------------
"  " Coc List
"  nnoremap <silent><space><space> :<C-u>CocFzfList<CR>
"  " Coc command
"  nnoremap <silent><space>c :<C-u>CocFzfList commands<CR>

"--------------
" ale.vim
"--------------
  let g:ale_fix_on_save = 1
  let g:ale_php_phpcbf_standard = 'PSR2'
  let g:ale_php_phpcs_standard = 'PSR2'

  " fixers
  let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'php': ['phpcbf'],
    \ 'go': ['goff'],
    \ 'json': ['fixjson', 'jq'],
    \ 'markdown': ['prettier'],
    \ 'python': ['autopep8', 'yapf'],
    \ 'javascript': ['prettier', 'eslint'],
    \ 'css': ['prettier'],
    \ 'html': ['prettier']
  \}

  " linter
  let g:ale_linters = {
  	    \ 'go': ['gopls'],
  \}

  " Set this. Airline will handle the rest.
  let g:airline#extensions#ale#enabled = 1

"--------------
" vim-anzu
"--------------
 " mapping
  nmap n <Plug>(anzu-n-with-echo)
  nmap N <Plug>(anzu-N-with-echo)
  nmap * <Plug>(anzu-star-with-echo)
  nmap # <Plug>(anzu-sharp-with-echo)

"--------------
" vim-cheatsheet
"--------------
  " cheart file
  let g:cheatsheet#cheat_file = '$DOTFILES_PATH/Doc/cheetsheet.md'

"--------------
" vim-winresizer
"--------------
  let g:winresizer_vert_resize = 5
  let g:winresizer_horiz_resize = 5

"--------------
" vim-airline
"--------------
  " airline theme
  let g:airline_theme='icebergDark'

"--------------
" vim-indent-guides.vim
"--------------
  let g:indent_guides_enable_on_vim_startup = 1
  hi IndentGuidesOdd  ctermbg=black
  hi IndentGuidesEven ctermbg=darkgrey
  let g:indent_guides_start_level = 2
  let g:indent_guides_guide_size = 1
  let g:indent_guides_exclude_filetypes = ['help', 'coc-explorer', 'fzf', 'startify']

"--------------
" vim-devicons
"--------------
  " airline
  let g:webdevicons_enable_airline_tabline = 1
  let g:webdevicons_enable_airline_statusline = 1
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"--------------
" previm
"--------------
  " markdown と拡張子を紐付ける
  augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  augroup END

"--------------
" vim-easymotion
"--------------
  " mapping
  nmap f <Plug>(easymotion-prefix)

"--------------
" vim-trailing-whitespace
"--------------
  let g:extra_whitespace_ignored_filetypes = ['help', 'coc-explorer', 'fzf', 'dashboard']

"--------------
" vim-startify
"--------------
  " vim-startify で開くときに、そのディレクトリに移動する
  let g:startify_change_to_dir = 1

  " git ディレクトリを開く場合は、トップディレクトリに移動する
  let g:startify_change_to_vcs_root = 1

  " empty buffer や quit を表示する
  let g:startify_enable_special = 1

  " 最初に表示する内容を記載する。
  let g:startify_lists = [
         \ { 'type': 'files',     'header': ['最近使ったファイル'] },
         \ { 'type': 'dir',       'header': ['カレントディレクトリ配下で最近使ったファイル'] },
         \ { 'type': 'sessions',  'header': ['Session']       },
         \ { 'type': 'bookmarks', 'header': ['Bookmarks']      },
         \ { 'type': 'commands',  'header': ['Commands']       },
      \ ]

  " 起動時のログを指定
  let g:startify_custom_header = [
        \ '  ___      ___ ___  _____ ______',
        \ ' |\  \    /  /|\  \|\   _ \  _   \',
        \ ' \ \  \  /  / | \  \ \  \\\__\ \  \',
        \ '  \ \  \/  / / \ \  \ \  \\|__| \  \',
        \ '   \ \    / /   \ \  \ \  \    \ \  \',
        \ '    \ \__/ /     \ \__\ \__\    \ \__\',
        \ '     \|__|/       \|__|\|__|     \|__|',
        \ ]
