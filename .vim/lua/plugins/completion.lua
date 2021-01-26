local use = require"packer".use

-- completion engine
local function init()
  -- use {'prabirshrestha/asyncomplete.vim',
  --   config = function()
  --     require"config.asyncomplete".init()
  --   end,
  --   requires = {
  --     {'prabirshrestha/asyncomplete-lsp.vim'},
  --     {'prabirshrestha/asyncomplete-buffer.vim'},
  --     {'prabirshrestha/asyncomplete-file.vim'},
  --     {'prabirshrestha/asyncomplete-ultisnips.vim'},
  --     {'wellle/tmux-complete.vim'}
  --   }
  -- }

  use {
     "nvim-lua/completion-nvim",
     config = function()
       require"config.completion".init()
     end,
     requires = {
       "steelsojka/completion-buffers",
       "honza/vim-snippets",
       "hrsh7th/vim-vsnip",
       "hrsh7th/vim-vsnip-integ",
     }
   }
end

return {
  init = init,
}
