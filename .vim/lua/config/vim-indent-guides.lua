local function init()
  vim.g.indent_guides_enable_on_vim_startup = 1
  vim.g.indent_guides_start_level = 2
  vim.g.indent_guides_guide_size = 1
  vim.cmd('hi IndentGuidesOdd  ctermbg=black')
  vim.cmd('hi IndentGuidesEven ctermbg=darkgrey')
  vim.g.indent_guides_exclude_filetypes = {
    'help',
    'packer',
    'lspsagafinder',
    'TelescopePrompt',
    'moving.lua'
  }
end

return {
  init = init,
}

