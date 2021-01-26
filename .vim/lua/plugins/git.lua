local use = require"packer".use

local function init()
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
