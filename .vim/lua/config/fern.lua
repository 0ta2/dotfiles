local api = vim.api
local opts = { noremap = true, silent = true }

local function init()
  vim.g['fern#default_hidden'] = 1,
  api.nvim_set_keymap('n', leader .. 'e', ':<C-u> Fern . -drawer -toggle -reveal=% <CR>', opts)
end

return {
  init = init,
}
