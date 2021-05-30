local use = require"packer".use

local function init()


  use {
    'TimUntersberger/neogit',
    config = function()
      require"config.neogit".init()
    end,
    requires = {
      {
        'nvim-lua/plenary.nvim'
      }
    }
  }

  use {
    'tpope/vim-fugitive'
  }
  use {
   'airblade/vim-gitgutter',
    config = function()
      require"config.vim-gitgutter".init()
    end
  }
  use {
    'tpope/vim-rhubarb'
  }
end

return {
  init = init,
}
