local use = require"packer".use

local function init()
  use {
    -- カッコを自動的に閉じる
    "jiangmiao/auto-pairs"
  }

  use {
    -- カッコの編集を便利するプラグイン
    'tpope/vim-surround'
  }
end

return {
  init = init,
}
