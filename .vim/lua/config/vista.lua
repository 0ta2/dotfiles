local function init()
  --vim.g.vista_icon_indent = {"󳄀󳄂 ", "󳄁󳄂 "}
  vim.g.vista_default_executive = 'coc'
  --vim.g["vista#renderer#icons"] = {
  --  ['func'] = '󿞔',
  --  ['function'] = '󿞔',
  --  ['functions'] = '󿞔',
  --  ['var'] = '󿜛',
  --  ['Variable'] = '󿜛',
  --  ['Variables'] = '󿜛',
  --  ['const'] = '󿣿',
  --  ['constant'] = '󿣿',
  --  ['method'] = '󿚦',
  --  ['class'] = '󿦩',
  --  ['property'] = '󿪶',
  --}
end

return {
  init = init,
}
