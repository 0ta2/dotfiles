local use = require"packer".use

local function init()
  use {
    'hoob3rt/lualine.nvim',
    config = function()
      require"config.lualine".init()
    end,
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
end

return {
  init = init,
}
