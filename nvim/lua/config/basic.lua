-- Character code settings.
vim.o.encoding = 'utf-8'

-- Specify the character encoding to be read.
vim.o.fileencodings = 'utf-8,iso-2022-jp,euc-jp,sjis'

-- Clipboard Settings.
vim.o.clipboard = 'unnamed,unnamedplus'

-- Consider only if the first letter is capitalized.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Make it possible to open a new file even if you haven't saved it.
vim.o.hidden = true

-- Set the completion mode.
vim.o.wildmode = 'longest:full'

-- If there is a file that has not been saved, check to see if it is saved before you exit.
vim.o.confirm = true

-- Use visual bell instead of beeping.
vim.o.visualbell = true

-- Number of screen lines to use for the command-line.
vim.o.cmdheight = 2

-- Print the line number in front of each line.
vim.wo.number = true

-- Show the line number relative to the line with the cursor in front of each line.
vim.wo.relativenumber = false

-- Highlight the screen line of the cursor with CursorLine.
vim.wo.cursorline = true

-- Highlight the screen column of the cursor with CursorColumn.
vim.wo.cursorcolumn = true

-- Use twice the width of ASCII characters.
-- dobule or single
vim.o.ambiwidth = 'single'

-- Last line in a window will be displayed.
vim.o.display = 'lastline'

-- Allow virtual editing in Visual block mode.
vim.o.virtualedit = 'block'

-- Text is shown normally
vim.wo.conceallevel = 0

-- Use the appropriate number of spaces to insert a <Tab>.
vim.o.expandtab = true

-- Number of spaces that a <Tab> in the file counts for.
vim.o.tabstop = 4

-- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
vim.o.softtabstop = 4

-- Number of spaces to use for each step of (auto)indent.
vim.o.shiftwidth = 4

-- Change regular expression to backtracking engine.
vim.o.regexpengine = 2

-- Maximum number of digits to search for a syntax item.
vim.o.synmaxcol = 300

-- The time it takes to redraw the screen.
vim.o.redrawtime = 1000

-- 24-bit color support
vim.o.termguicolors = true

-- lspsaga.nvim で表示のチラツキ防止の為
-- NOTE: https://stackoverflow.com/questions/78364323/im-having-trouble-with-flickering-in-lspsaga-nvim
vim.opt.signcolumn = "yes"

-- 蒸し文字列の可視化
vim.opt.list = true
vim.opt.listchars = { tab = '>>', trail = '-', nbsp = '+' }

-- undofile
vim.cmd [[ set undofile ]]
vim.cmd [[ set undodir=$XDG_STATE_HOME/nvim/undo ]]

-- backupfile
vim.cmd [[ set backup ]]
vim.cmd [[ set backupdir=$XDG_STATE_HOME/nvim/backup ]]

-- Set the behavior at completion.
vim.o.completeopt = 'menu,menuone,noselect'

-- Settings python.
vim.g.python_host_prog = vim.env.HOME .. '/.pyenv/versions/py2pynvim/bin/python'
vim.g.python3_host_prog = vim.env.HOME ..  '/.pyenv/versions/py3pynvim/bin/python'
-- Settings ruby.
vim.g.ruby_host_prog = vim.env.HOME .. '/.rbenv/versions/2.7.1/bin/neovim-ruby-host'
-- Settings node.
vim.g.node_host_prog = vim.env.HOME .. '/.nodenv/versions/16.6.0/bin/neovim-node-host'
