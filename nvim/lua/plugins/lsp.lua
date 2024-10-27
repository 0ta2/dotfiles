local lsp_servers = {
    "lua_ls",
    "gopls",
}

return {
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
                 end,
            })
        end,
    }
}
