local api = vim.api

local M = {}

function M.setup_settings()
  local saga = require 'lspsaga'

  saga.init_lsp_saga {
    use_saga_diagnostic_sign = true,
    -- diagnostic sign
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    -- jump diagnostic header
    error_header = "  Error",
    warn_header = "  Warn",
    hint_header = "  Hint",
    infor_header = "  Infor",
    max_diag_msg_width = 50,
    -- code action title icon
    code_action_icon = '󿠵 ',
    finder_definition_icon = '󿰍  ',
    finder_reference_icon = '󿰍  ',
    finder_action_keys = {
      open = 'o', vsplit = 's',split = 'i',quit = 'q'
    },
    definition_preview_icon = '󿰍  ',
    -- 1: thin border | 2: rounded border | 3: thick border
    border_style = 1,
    rename_prompt_prefix = '➤',
    server_filetype_map = {}
  }
end

function M.setup_keymappings()
  local opts = { noremap = true, silent = true }
  -- api.nvim_set_keymap('n', 'ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
  api.nvim_set_keymap("n", "gh", '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)
  -- api.nvim_set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
  -- api.nvim_set_keymap('n', '<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
  api.nvim_set_keymap('n', leader .. 'rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
end

function M.init()
  M.setup_keymappings()
  M.setup_settings()
end

return M
