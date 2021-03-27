local M = {}

function M.nvcode()
  vim.g.nvcode_termcolors = 256
  vim.cmd [[ colorscheme onedark ]]
end

function M.sonokai()
  vim.g.sonokai_style = 'shusia'
  vim.g.sonokai_enable_italic = 1
  vim.g.sonokai_disable_italic_comment = 1
  vim.cmd [[ colorscheme sonokai ]]
end

function M.moonfly()
  vim.cmd [[ colorscheme moonfly ]]
end

function M.oceanic_next()
  vim.cmd [[ colorscheme OceanicNext ]]
end

function M.vim_gruvbox8()
  vim.cmd [[ set background=dark ]]
  vim.cmd [[ colorscheme gruvbox8 ]]
end

function M.melange()
  vim.cmd [[ colorscheme melange ]]
end

function M.init()
  -- M.nvcode()
  -- M.sonokai()
  -- M.moonfly()
  -- M.vim_gruvbox8()
  M.melange()
end

return M
