local use = require"packer".use

local function init()
  -- lsp config
  -- use {
  --   'prabirshrestha/vim-lsp',
  --   config = function()
  --     require"config.vim-lsp".init()
  --   end,
  --   requires = {
  --     {'mattn/vim-lsp-settings'}
  --   }
  -- }

  use {
    "neovim/nvim-lspconfig",
    config = function()
      require"config.nvim-lspconfig".init()
    end
  }

  -- lsp tagbar
  use {
    "liuchengxu/vista.vim",
    cmd = "Vista",
    config = function()
      require "config.vista".init()
    end
  }
end

return {
  init = init,
}
