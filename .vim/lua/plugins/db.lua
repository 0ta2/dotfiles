local use = require("packer").use

local function init()
  use {
    'tpope/vim-dadbod',
    requires = {
      {
        'kristijanhusak/vim-dadbod-ui'
      }
    }
  }
end

return {
  init = init,
}
