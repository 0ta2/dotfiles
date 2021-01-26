local use = require"packer".use

local function init()
  use {'easymotion/vim-easymotion',
    config = function()
      require"config.vim-easymotion".init()
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
