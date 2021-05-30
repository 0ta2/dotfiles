local use = require"packer".use

local function init()
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require"config.nvim-treesitter".init()
    end
  }
end

return {
  init = init,
}
