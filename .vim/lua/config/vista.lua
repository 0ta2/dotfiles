local function setup()
  vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
  vim.g.vista_default_executive = 'vim_lsp'
  vim.g['vista#renderer#icons'] = {
    ["function"] = "𝑓",
    ["variable"] = "𝜈",
  }
end

return {
  setup = setup
}
