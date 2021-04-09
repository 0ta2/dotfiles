local api = vim.api

local M = {}

function M.setup_settings()
  local saga = require 'lspsaga'
  saga.init_lsp_saga()
end

function M.setup_keymappings()
  local opts = { noremap = true, silent = true }
  api.nvim_set_keymap('n', 'gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)
  api.nvim_set_keymap('n', 'ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
  api.nvim_set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
  api.nvim_set_keymap('n', '<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
  api.nvim_set_keymap('n', leader .. 'rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
end

function M.init()
  M.setup_keymappings()
  M.setup_settings()
end

return M
