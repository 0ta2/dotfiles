local api = vim.api

local M = {}

function M.init()
  vim.cmd('set omnifunc=lsp#complete')

  local opts = { noremap = false, silent = true }
  api.nvim_set_keymap('n', 'gd', '<Plug>(lsp-definition)', opts)
  api.nvim_set_keymap('n', 'gr', '<Plug>(lsp-references)', opts)
  api.nvim_set_keymap('n', 'gi', '<Plug>(lsp-implementation)', opts)
  api.nvim_set_keymap('n', 'gt', '<Plug>(lsp-type-definition)', opts) 
  api.nvim_set_keymap('n', leader .. 'rn', '<Plug>(lsp-rename)', opts)
  api.nvim_set_keymap('n', '[g', '<Plug>(lsp-previous-diagnostic)', opts)
  api.nvim_set_keymap('n', ']g', '<Plug>(lsp-next-diagnostic)', opts)
  api.nvim_set_keymap('n', 'K', '<Plug>(lsp-hover)', opts)
end

return M
