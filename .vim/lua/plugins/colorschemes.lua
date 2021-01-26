local use = require"packer".use

local function init()
  use {
    'christianchiarulli/nvcode-color-schemes.vim',
    config = function()
      require"config.colorscheme".init()
    end
  }
end

return {
  init = init,
}
