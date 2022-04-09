local use = require('packer').use

local function init()
  use {
    'vim-denops/denops.vim',
    requires = { 'lambdalisue/gin.vim' }
  }
end

return {
  init = init,
}
