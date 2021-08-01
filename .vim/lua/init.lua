-- Basic Settings
require"basic"

-- Basic Key Mapping
require"keymap"

-- Require plugins
require"plugins".init()

-- develop
--vim.cmd([[ command! Format lua require'develop'.Format()]])
vim.cmd([[  autocmd bufWritePost *.ts :Format ]])
