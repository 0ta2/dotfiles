local use = require"packer".use

local function init()
  use {
    -- 置換のプレビュー
    'markonm/traces.vim'
  }

  use {
    'kevinhwang91/nvim-hlslens',
  }
end

return {
  init = init,
}
