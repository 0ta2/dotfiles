local api = vim.api

local M = {}

function M.init()
  local opts = { noremap = true, expr = true }
  api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', opts)
  api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', opts)
  api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? asyncomplete#close_popup() : "<CR>"', opts)

  vim.cmd [[ call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({ 'name': 'buffer', 'allowlist': ['*'], 'blocklist': ['go'], 'completor': function('asyncomplete#sources#buffer#completor'), 'config': { 'max_buffer_size': 5000000, }, })) ]]
      vim.cmd [[ call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({ 'name': 'file', 'allowlist': ['*'], 'completor': function('asyncomplete#sources#file#completor'), 'config': { 'max_buffer_size': 5000000, }, })) ]]
  vim.cmd [[ call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({ 'name': 'ultisnips', 'allowlist': ['*'], 'completor': function('asyncomplete#sources#ultisnips#completor'), })) ]]

  -- asyncomplete
  vim.g.asyncomplete_auto_popup = 1
  vim.g.asyncomplete_auto_completeopt = 0

  -- Snippet
  vim.g.UltiSnipsExpandTrigger = "<C-j>"
  vim.g.UltiSnipsJumpForwardTrigger = "<C-n>"
  vim.g.UltiSnipsJumpBackwardTrigger = "<C-p>"
end

return M
