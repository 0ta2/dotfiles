local M = {}

function M.init()
  vim.g.nvcode_termcolors = 256
  vim.cmd [[ colorscheme nvcode ]]
end

return M
