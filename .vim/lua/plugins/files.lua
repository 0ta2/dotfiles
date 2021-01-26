local use = require"packer".use

local function init()
  -- フォルダツリーの表示
  use {
    "lambdalisue/fern.vim",
    setup = function()
      require"config.fern".init()
    end
  }

  -- 末尾の空白スペースの表示
  use {
    'bronson/vim-trailing-whitespace',
    config = function()
      require"config.vim-trailing-whitespace".init()
    end
  }

end

return {
  init = init,
}
