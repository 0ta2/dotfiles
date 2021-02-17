local lspconfig = require'lspconfig'

local function on_attach(client)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'fo', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

local lsp_servers = os.getenv("HOME") .. '/.local/share/vim-lsp-settings/servers'

local servers = {
  sumneko_lua = {
    cmd = { lsp_servers .. "/sumneko-lua-language-server/sumneko-lua-language-server" , "-E", lsp_servers .. "/sumneko-lua-language-server/extension/server/main.lua" };
    settings = {
      Lua = {
        diagnostics = {
          globals = {
            'vim',
            'bufnr'
          },
        },
      }
    }
  },
  intelephense = {
    cmd = { "intelephense", "--stdio" },
  },
  pyls = {
    cmd = { lsp_servers .. "/pyls/venv/bin/pyls" };
  },
  denols = {
    cmd = { lsp_servers .. "/deno/deno", "lsp" };
  },
  dockerls = {},
  html = {},
  cssls = {},
  vimls = {},
  yamlls = {},
  gopls = {},
  bashls = {}
}

for server, config in pairs(servers) do
  config.on_attach = on_attach
  lspconfig[server].setup(config)
end
