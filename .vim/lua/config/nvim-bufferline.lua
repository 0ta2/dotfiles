local M = {}


function M.init()
  require'bufferline'.setup{
    options = {
      view = "default",
      numbers = "none",
      buffer_close_icon= '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 15,
      tab_size = 18,
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = false,
      persist_buffer_sort = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
    }
  }
end

return M
