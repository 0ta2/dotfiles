local use = require"packer".use

local function init()
  use {'easymotion/vim-easymotion',
    config = function()
      require"config.vim-easymotion".init()
    end
  }

  use {
    'phaazon/hop.nvim',
    config = function ()
      require"config.hop".init()
      vim.cmd([[ highlight default HopNextKey1 guifg=#fff200 gui=bold blend=0 ]])
      vim.cmd([[ highlight default HopNextKey2 guifg=#ede8eb blend=0 ]])
    end
  }

  -- カッコ移動の強化
  use {
    'andymass/vim-matchup'
  }

  -- カーソル操作
  use {
    'terryma/vim-multiple-cursors'
  }
end

return {
  init = init,
}
