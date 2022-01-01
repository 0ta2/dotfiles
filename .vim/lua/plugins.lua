-- install packer.nvim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

----Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

-- Auto PackerCompile
vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

local packer = nil
local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({disabe_commands = false})
  end

  local use = packer.use
  packer.reset()

  use {'wbthomason/packer.nvim', opt = true}

  require"plugins.colorschemes".init()
  --require"plugins.completion".init()
  require"plugins.lsp".init()
  require"plugins.delimiters".init()
  require"plugins.files".init()
  require"plugins.editing".init()
  require"plugins.language".init()
  require"plugins.fuzzy-finder".init()
  require"plugins.tab".init()
  require"plugins.tmux".init()
  require"plugins.window".init()
  require"plugins.markdown".init()
  require"plugins.git".init()
  require"plugins.search".init()
  require"plugins.moving".init()
  require"plugins.help".init()
  require"plugins.color".init()
  require"plugins.support".init()
  require"plugins.treesitter".init()
  require"plugins.statusline".init()
  --require"plugins.wilder".init()
  require("plugins.denops").init()
  require("plugins.db").init()
end

return {
  init = init,
}
