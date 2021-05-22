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

  --use {
  --  "neovim/nvim-lspconfig",
  --  config = function()
  --    require"config.nvim-lspconfig"
  --  end,
  --  requires = {
  --    --{
  --    --  'mattn/vim-lsp-settings'
  --    --},
  --    {
  --      'glepnir/lspsaga.nvim',
  --      config = function()
  --        require"config/lspsaga".init()
  --      end
  --    }
  --  }
  --}

  ---- lsp tagbar
  --use {
  --  "liuchengxu/vista.vim",
  --  cmd = "Vista",
  --  config = function()
  --    require "config.vista".init()
  --  end
  --}

  use {
    'neoclide/coc.nvim',
    branch = 'master',
    run = 'yarn install --frozen-lockfile',
    config = function()
      require"config.coc".init()
    end
  }
end

return {
  init = init,
}
