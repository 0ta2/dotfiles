local use = require"packer".use

local function init()
  use {
    'TimUntersberger/neogit',
    config = function ()
      require"config.neogit".init()
    end
  }
  use {
    'tpope/vim-fugitive'
  }
  use {
    'airblade/vim-gitgutter'
  }
  use {
    'tpope/vim-rhubarb'
  }
end

return {
  init = init,
}
