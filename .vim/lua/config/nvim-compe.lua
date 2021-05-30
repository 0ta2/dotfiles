local api = vim.api

local M = {}

function M.setup_keymappings()
  local opts = { noremap = true, expr = true }
  api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', opts)
  api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', opts)
  api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? compe#confirm("<CR>") : "<CR>"', opts)
end

function M.setup_settings()
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    allow_prefix_unmatch = false;

    source = {
      path = true;
      buffer = true;
      calc = true;
      nvim_lsp = true;
      nvim_lua = true;
      vsnip = true;
      tmux = true;
    };
  }
end

function M.init()
  M.setup_keymappings()
  M.setup_settings()
end

return M
