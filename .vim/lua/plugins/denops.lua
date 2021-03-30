local use = require"packer".use

local function init()
  use {
    "vim-denops/denops.vim"
  }
end

return {
  init = init,
}
