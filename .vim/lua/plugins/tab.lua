local use = require"packer".use

local function init()
  --use {
  --  'ap/vim-buftabline'
  --}

  use {
    'akinsho/bufferline.nvim',
    config = function ()
      require'config.nvim-bufferline'.init()
    end,
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }

end

return {
  init = init,
}
