local use = require("packer").use

local function init()
  use {
    'tpope/vim-dadbod',
    requires = {
      {
        'kristijanhusak/vim-dadbod-ui',
        config = function()
          require("config.vim-dadbod-ui")
        end
      }
    }
  }
end

return {
  init = init,
}
