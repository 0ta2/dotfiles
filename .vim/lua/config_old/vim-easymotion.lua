local api = vim.api
local opts = { noremap = false, silent = true }

local M = {}

function M.init()
  api.nvim_set_keymap('', 'f', '<Plug>(easymotion-prefix)', opts)
end

return M
