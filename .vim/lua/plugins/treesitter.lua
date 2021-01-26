local use = require"packer".use

local function init()
  use {
    'nvim-treesitter/nvim-treesitter'
  }
end

return {
  init = init,
}
