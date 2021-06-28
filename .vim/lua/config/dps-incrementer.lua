local M = {}

function M.setup_settings()
  local api = vim.api
  local opts = { noremap = true, silent = false }
  api.nvim_set_keymap('n', '+', ':Incrementer<CR>', opts)
  api.nvim_set_keymap('n', '-', ':Decrement<CR>', opts)
end

function M.init()
  M.setup_settings()
end

return M
