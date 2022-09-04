local use = require"packer".use

local function init()
  -- help の日本語化
  use {
    'vim-jp/vimdoc-ja'
  }
end

return {
  init = init,
}
