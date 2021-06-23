local M = {}

function M.setup_settings()
  vim.cmd([[ autocmd FileType dbui nmap <buffer> o <Plug>(DBUI_SelectLine) ]])
end

function M.init()
  M.setup_settings()
end

return M
