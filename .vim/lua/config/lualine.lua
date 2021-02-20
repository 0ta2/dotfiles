local M = {}

function M.init()
  local lualine = require('lualine')
  lualine.options = {
    theme = 'ayu_dark',
    section_separators = {'', ''},
    component_separators = {'', ''},
    icons_enabled = true,
  }
  lualine.sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location'  },
  }
  lualine.inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {   }
  }
  lualine.status()
end

return M
