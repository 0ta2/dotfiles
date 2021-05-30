local use = require"packer".use

local function init()
  use {
    -- コメントアウト
    "tpope/vim-commentary"
  }
end

return {
  init = init,
}
