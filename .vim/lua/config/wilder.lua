local api = vim.api

local M = {}

function M.init()
  local opts = { expr = true, noremap = false, silent = true }

  vim.fn['wilder#enable_cmdline_enter']()

  vim.cmd [[ set wildcharm=<Tab> ]]

  api.nvim_set_keymap('c', '<Tab>', 'wilder#in_context() ? wilder#next() : "<Tab>"', opts)
  api.nvim_set_keymap('c', '<S-Tab>', 'wilder#in_context() ? wilder#previous() : "<S-Tab>"', opts)

  vim.fn['wilder#set_option']('modes', {'/', '?', ':'})
end

return M
