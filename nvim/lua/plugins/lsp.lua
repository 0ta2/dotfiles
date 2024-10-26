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
                local file = io.open("lsp." .. lsp .. ".lua", "r")
                if file then
                    file:close()
                    handlers[lsp] = function()
                        local settings = require("lsp." .. lsp)
                        require("lspconfig")[lsp].setup(settings)
                    end
                end
            end

            require("mason-lspconfig").setup_handlers(handlers)
        end,
    }
}
