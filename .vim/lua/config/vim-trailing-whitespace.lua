local function init()
  vim.g.extra_whitespace_ignored_filetypes = {
    'help',
    'packer',
    'lspsagafinder',
    'TelescopePrompt'
  }
end

return {
  init = init,
}
