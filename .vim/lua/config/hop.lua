local M = {}

function M.setup_settings()
  require'hop'.setup{}
end

function M.setup_keymappings()
  local api = vim.api
  local opts = { noremap = false, silent = true }

  api.nvim_set_keymap('n', 'fs', "<cmd>lua require'hop'.hint_char1()<cr>", opts)
end


function M.init()
  M.setup_settings()
  M.setup_keymappings()
end

return M
