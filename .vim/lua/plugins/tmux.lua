local use = require"packer".use

local function init()
  use {
    'christoomey/vim-tmux-navigator',
    cnfig = function()
      require"config.vim-tmux-navigator".init()
    end
  }
end

return {
  init = init,
}
