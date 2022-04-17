local M = {}

function M.init()
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      disable = {}
    },
    indent = {
      enable = true,
    },
    ensure_installed = 'all'
  }
end

return M
