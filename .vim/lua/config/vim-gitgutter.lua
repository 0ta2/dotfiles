local api = vim.api

local M = {}

function M.init()
  local opts = { noremap = true, silent = false }
  api.nvim_set_keymap('n', leader .. 'hs', ':GitGutterStageHunk<CR>', opts)
  api.nvim_set_keymap('n', leader .. 'hu', ':GitGutterUndoHunk<CR>', opts)
  api.nvim_set_keymap('n', leader .. 'hv', ':GitGutterPreviewHunk<CR>', opts)
end

return M
