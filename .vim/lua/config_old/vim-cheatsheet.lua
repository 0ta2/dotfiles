local M = {}

function M.init()
  vim.g['cheatsheet#cheat_file'] = vim.env.DOTFILES_PATH .. '/Doc/cheetsheet.md'
end

return M
