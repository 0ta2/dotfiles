local function init()
  vim.g.vista_icon_indent = {"󳄀󳄂 ", "󳄁󳄂 "}
  vim.g.vista_default_executive = 'vim_lsp'
  vim.g["vista#renderer#icons"] = {
    ['function'] = '󿞔',
    ['functions'] = '󿞔',
    ['class'] = '󿦩',
    ['property'] = '󿪶'
  }
end

return {
  init = init,
}
