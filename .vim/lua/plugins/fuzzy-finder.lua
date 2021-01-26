local use = require"packer".use

local function init()
  use {
    'ctrlpvim/ctrlp.vim',
    config = function()
      require"config/ctrlp".init()
    end,
    requires = {
      {'endel/ctrlp-filetype.vim'},
      {'fisadev/vim-ctrlp-cmdpalette'},
      {'halkn/ctrlp-ripgrep'}
    }
  }
end

return {
  init = init,
}
