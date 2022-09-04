local api = vim.api

local M = {}

function M.setup_settings()
  vim.g.ctrlp_map = '<Nop>'
  vim.g.ctrlp_extensions = {'tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir', 'filetype'}
  vim.g.ctrlp_user_command = {'.git', 'rg %s --files --hidden --color=never' }
  vim.g.ctrlp_use_caching = 0
end

function M.setup_keymappings()
  local opts = { noremap = true, silent = true }
  api.nvim_set_keymap('n', leader .. leader, ':<C-u> CtrlPMixed <CR>', opts)
  api.nvim_set_keymap('n', leader .. 'b', ':<C-u> CtrlPBuffer <CR>', opts)
  api.nvim_set_keymap('n', leader .. 'l', ':<C-u> CtrlPLine <CR>', opts)
  api.nvim_set_keymap('n', leader .. 'fi', ':<C-u> CtrlPFiletype <CR>', opts)
  api.nvim_set_keymap('n', leader .. 'c', ':<C-u> CtrlPCmdPalette <CR>', opts)
  api.nvim_set_keymap('n', leader .. 'r', ':<C-u> CtrlPRg <CR>', opts)
end


function M.init()
   M.setup_settings()
   M.setup_keymappings()
end

return M
