local use = require"packer".use

local function init()
  use {
    -- 各種言語の設定集
    'sheerun/vim-polyglot'
  }

  use {
    'evidens/vim-twig'
  }

  -- インデント表示
  use {
    'nathanaelkane/vim-indent-guides',
    config = function()
      require"config.vim-indent-guides".init()
    end
  }
end

return {
  init = init,
}
