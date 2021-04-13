local lspconfig = require'lspconfig'

local function on_attach(client, bufnr)
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

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "for", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "for", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
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
          },
        },
      }
    }
  },
  intelephense = {
    cmd = { lsp_servers ..  "/intelephense/intelephense", "--stdio" },
  },
  pyls = {
    cmd = { lsp_servers .. "/pyls/venv/bin/pyls" };
  },
  --tsserver = {
  -- cmd = { lsp_servers .. "/typescript-language-server/typescript-language-server", "--stdio" };
  --},
  denols = {
    cmd = { lsp_servers .. "/deno/deno", "lsp" };
  },
  dockerls = {},
  html = {
    cmd = { lsp_servers .. "/html-languageserver/html-languageserver", "--stdio" };
    filetypes = { "html", "twig"}
  },
  cssls = {},
  vimls = {},
  yamlls = {
    cmd = { lsp_servers .. "/yaml-language-server/yaml-language-server", "--stdio"};
    settings = {
      json = {
        schemas = {
          {
            description = "Docker Compose",
            fileMatch = "docker-compose*.{yml,yaml}",
            url = "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"
          },
          {
            description = "GitHub WorkFlow",
            fileMatch = '.github/workflows/*.{yml,yaml}',
            url = "https://json.schemastore.org/github-workflow.json"
          },
          {
            description = "GitHub Action",
            fileMatch = '.github/action.{yml,yaml}',
            url = "https://json.schemastore.org/github-action.json"
          },
        },
      },
    },
  },
  gopls = {},
  bashls = {}
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = capabilities
  lspconfig[server].setup(config)
end
