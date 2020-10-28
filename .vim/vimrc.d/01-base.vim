"--------------
" Basic Settings
"--------------
" Character code setting.
set encoding=utf-8

" Specify the character encoding to be read.
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" Clipboard Settings.
set clipboard^=unnamedplus

" Saves undo history.
set undofile

" Clipboard Settings.
set clipboard^=unnamedplus

" Consider only if the first letter is capitalized.
set ignorecase

" Make it possible to open a new file even if you haven't saved it.
set hidden

" Set the completion mode.
set wildmode=longest,list

" If there is a file that has not been saved, check to see if it is saved before you exit.
set confirm

" Use visual bell instead of beeping.
set visualbell

" Number of screen lines to use for the command-line.
set cmdheight=2

" Print the line number in front of each line.
set number

" Show the line number relative to the line with the cursor in front of each line.
set relativenumber

" No timeout about mapping.
set notimeout

" Highlight the screen line of the cursor with CursorLine.
set cursorline

" Highlight the screen column of the cursor with CursorColumn.
set cursorcolumn

" Use twice the width of ASCII characters.
set ambiwidth=double

" Use twice the width of ASCII characters.
set ambiwidth=double

" Last line in a window will be displayed.
set display=lastline

" Allow virtual editing in Visual block mode.
set virtualedit=block

" Text is shown normally
set conceallevel=0

" Last line in a window will be displayed.
set display=lastline

" Allow virtual editing in Visual block mode.
set virtualedit=block

" Text is shown normally
set conceallevel=0

" Use the appropriate number of spaces to insert a <Tab>.
set expandtab

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2

" Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
set softtabstop=2

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=2

" The kind of folding used for the current window.
set foldmethod=indent

" Settings python.
let g:python_host_prog="$HOME/.pyenv/versions/py2neovim/bin/python"
let g:python3_host_prog="$HOME/.pyenv/versions/py3neovim/bin/python"

" Settings ruby.
let g:ruby_host_prog="$HOME/.rbenv/versions/2.7.1/bin/neovim-ruby-host"

" Settings node.
let g:node_host_prog="$HOME/.nodenv/versions/14.8.0/bin/neovim-node-host"
