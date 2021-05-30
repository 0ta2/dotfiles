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
    ensure_installed = 'maintained'
  }
end

return M
