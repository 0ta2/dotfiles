local use = require"packer".use

local function init()
  use {
    'olimorris/onedarkpro.nvim',
    config = function()
      require("config.colorscheme").init()
    end
  }

  use {
    'christianchiarulli/nvcode-color-schemes.vim',
    --config = function()
    --  require"config.colorscheme".init()
    --end
  }

  use {
    'sainnhe/sonokai',
    -- config = function()
    --   require"config.colorscheme".init()
    -- end
  }

  use {
    'bluz71/vim-moonfly-colors',
    -- config = function()
      -- require"config.colorscheme".init()
    -- end
  }

  use {
    'mhartington/oceanic-next',
  --   config = function()
  --     require"config.colorscheme".init()
  --   end
  }

  use {
    'lifepillar/vim-gruvbox8',
    -- config = function()
    --   require"config.colorscheme".init()
    -- end
  }

  use {
    'savq/melange',
    -- config = function ()
    --   require"config.colorscheme".init()
    -- end
  }

  use {
    'sainnhe/gruvbox-material',
    --config = function()
    --  require"config.colorscheme".init()
    --end
  }
end

return {
  init = init,
}
