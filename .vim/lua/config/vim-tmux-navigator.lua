local api = vim.api
local M = {}

function M.setup_settings()
  vim.g.tmux_navigator_no_mappings = 1
  vim.g.tmux_navigator_save_on_switch = 2
  vim.g.tmux_navigator_no_mappings = 1
end

function M.setup_keymappings()
  local opts = { noremap = true, silent = true }
  api.nvim_set_keymap('n', '<C-S-h>', ':TmuxNavigateLeft <CR>', opts)
  api.nvim_set_keymap('n', '<C-S-j>', ':TmuxNavigateDown <CR>', opts)
  api.nvim_set_keymap('n', '<C-S-k>', ':TmuxNavigateUp <CR>', opts)
  api.nvim_set_keymap('n', '<C-S-l>', ':TmuxNavigateRight <CR>', opts)
  vim.api.nvim_set_keymap('n', '<C-S-\\>', ':TmuxNavigatePrevious <CR>', opts)
end

function M.init()
  M.setup_settings()
  M.setup_keymappings()
end


return M
