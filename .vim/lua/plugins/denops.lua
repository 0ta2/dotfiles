local use = require("packer").use

local function init()
  use {
    "vim-denops/denops.vim",
    requires = {
      {
        '~/ghq/github.com/0ta2/dps-incrementer/',
        config = function()
          require("config.dps-incrementer").init()
        end
      }
    }
  }
end

return {
  init = init,
}
