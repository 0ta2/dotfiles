local lsp_servers = {
    "lua_ls",
    "gopls",
}

return {
    {
        "nvimdev/lspsaga.nvim",
        opts = {
            symbol_in_winbar = {
                separator = "  ",
            },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        event = { "BufRead", "BufNewFile" },
    },

    { "neovim/nvim-lspconfig" },

    { "williamboman/mason.nvim", config = true},

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = lsp_servers
            }

            local handlers = {
                -- default handler
                function (server_name)
                    require("lspconfig")[server_name].setup {}
                end
            }

            for _, lsp in ipairs(lsp_servers) do
                local ok, handler = pcall(require, "lsp." .. lsp)
                if ok then
                    handlers[lsp] = handler
                else
                    print("エラー: ", lsp, "の設定ファイルはありません")
                end
            end

            require("mason-lspconfig").setup_handlers(handlers)

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("LspConfig", {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                    local util = require("util")
                    local keymap = vim.keymap.set

                    keymap("n", "gd", vim.lsp.buf.definition, util.ex_opts("Go to definition", ev.buf))

                    --vim.keymap.set('n', 'gd', [[<cmd>:lua vim.lsp.buf.definition()<cr>]], opts)

                    --vim.keymap.set('n', 'gD', [[<cmd>:lua vim.lsp.buf.declaration()<cr>]], opts)

                    --vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                    --vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                    --vim.keymap.set('n', 'K', [[<cmd>:lua vim.lsp.buf.hover()<cr>]], opts)
                    ---- vim.keymap.set('n', 'gr', [[<cmd>:lua vim.lsp.buf.references()<cr>]], opts)
                    ---- vim.keymap.set('n', 'gi', [[<cmd>:lua vim.lsp.buf.implementation()<cr>]], opts)
                    --vim.keymap.set('n', leader .. 'K', [[<cmd>:lua vim.lsp.buf.signature_help()<cr>]], opts)
                    --vim.keymap.set('n', leader .. 'a', [[<cmd>:lua vim.lsp.buf.code_action()<cr>]], opts)
                    --vim.keymap.set('n', leader .. 'rn', [[<cmd>:lua vim.lsp.buf.rename()<cr>]], opts)
                    --vim.keymap.set('n', leader .. 'f', [[<cmd>:lua vim.lsp.buf.format()<cr>]], opts)

                end,
            })
        end,
    }
}
