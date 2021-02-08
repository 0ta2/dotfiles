local use = require"packer".use

local function init()
  -- use {
  --   'ctrlpvim/ctrlp.vim',
  --   config = function()
  --     require"config/ctrlp".init()
  --   end,
  --   requires = {
  --     {'endel/ctrlp-filetype.vim'},
  --     {'fisadev/vim-ctrlp-cmdpalette'},
  --     {'halkn/ctrlp-ripgrep'}
  --   }
  -- }

  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require"config/telescope".init()
    end,
    requires = {
      {
        'nvim-lua/popup.nvim'
      }, {
        'nvim-lua/plenary.nvim'
      }
    }
  }

end

return {
  init = init,
}
