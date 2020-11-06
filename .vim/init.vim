"--------------
" mapleader
"--------------
" mapleader を指定
let mapleader = "\<Space>"

"--------------
" dein.vim
"--------------
" dein.vim settings
  let s:dein_dir = expand('~/.cache/dein')
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein installation check
  if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
  endif
    set background=dark

" begin settings
  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " .tmol file
      let s:rc_dir = expand('~/.vim')
      let s:toml = s:rc_dir . '/dein.toml'
      let s:lazy = s:rc_dir . '/lazy.toml'

    " read toml and cache
      call dein#load_toml(s:toml, {'lazy': 0})
      call dein#load_toml(s:lazy, {'lazy': 1})

    call dein#end()
    call dein#save_state()
  endif

" plugin installation check
  if dein#check_install()
    call dein#install()
  endif

" plugin remove check
  let s:removed_plugins = dein#check_clean()
  if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
  endif

filetype plugin indent on
syntax enable

"--------------
" Load vim files
"--------------
runtime! vimrc.d/*.vim
