local function init()
  vim.g.extra_whitespace_ignored_filetypes = {
    'help',
    'packer'
  }
end

return {
  init = init,
}
