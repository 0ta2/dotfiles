local use = require"packer".use

local function init()
  use {
    'previm/previm',
    ft = {'md', 'markdown'},
    requires = {
      'tyru/open-browser.vim'
    }
  }
end

return {
  init = init,
}
