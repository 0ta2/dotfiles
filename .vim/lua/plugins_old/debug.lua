local use = require("packer").use

local function init()
  use {
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",
      "leoluz/nvim-dap-go",
    },
    config = function ()
      require("config.nvim-dap")
    end,
  }
end

return {
  init = init,
}
