local use = require"packer".use

local function init()
  -- チートシート
  use {
    'reireias/vim-cheatsheet',
    config = function()
      require"config.vim-cheatsheet".init()
      vim.g['cheatsheet#cheat_file'] = vim.env.DOTFILES_PATH .. '/Doc/cheetsheet.md'
    end
  }
end

return {
  init = init,
}
