local use = require"packer".use

local function init()
  use {
    'gelguy/wilder.nvim',
    config  = function()
      require"config.wilder".init()
    end
  }
end

return {
  init = init,
}
