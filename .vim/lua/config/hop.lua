local M = {}

function M.setup_settings()
  require'hop'.setup{}
end

function M.setup_keymappings()
end


function M.init()
  M.setup_settings()
  M.setup_keymappings()
end

return M
