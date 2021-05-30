local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

return {
  configs.pyls = {
    default_config = {
      cmd = { "/Users/0ta2/.local/share/vim-lsp-settings/servers/pyls/venv/bin/pyls" };
      filetypes = {'python'};
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end;
      settings = {}
    }
  }
}
