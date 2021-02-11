local M = {}

function M.init()
  vim.g.ompletion_enable_snippet = "vim-vsnip"

  vim.cmd [[ autocmd BufEnter * lua require'config/completion'.on_attach() ]]
  vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { noremap = true, expr = true })
  vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { noremap = true, expr = true })

  vim.cmd [[ inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>" ]]
end

function M.on_attach()
  local chain_complete_list = {
    default = {
      {
        complete_items = {
          path = true;
          buffer = true;
          calc = true;
          vsnip = true;
          nvim_lsp = true;
          nvim_lua = true;
          spell = true;
          tags = true;
          snippets_nvim = true;
          treesitter = true;
        }
      },
    },
  }

  require'completion'.on_attach {
    chain_complete_list = chain_complete_list,
  }
end

return M
