local use = require"packer".use

local function init()
  use {
    'ap/vim-buftabline'
  }
end

return {
  init = init,
}
