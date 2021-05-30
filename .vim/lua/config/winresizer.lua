local function init()
  local api = vim.api
  local opts = { noremap = true, silent = true }

  api.nvim_set_keymap('n', '<C-e>', ':WinResizerStartResize<CR>', opts)
  vim.g.winresizer_vert_resize = 5
  vim.g.winresizer_horiz_resize = 5
end

return {
  init = init,
}

