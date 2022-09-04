local use = require"packer".use

local function init()
  -- カラーのプレビュー
  use {
    'gko/vim-coloresque'
  }
end

return {
  init = init,
}
