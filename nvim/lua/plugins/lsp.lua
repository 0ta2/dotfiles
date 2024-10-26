local lsp_servers = {
    "lua_ls",
    "gopls",
}

return {
    { "neovim/nvim-lspconfig" },

    { "williamboman/mason.nvim", config = true},

    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = lsp_servers
        },
        config = function()
            local handlers = {}
            for _, lsp in ipairs(lsp_servers) do
                handlers[lsp] = function()
                    local settings = require("lsp." .. lsp)
                    require("lspconfig")[lsp].setup(settings)
                end
            end

          require("mason-lspconfig").setup_handlers(handlers)
        end,
    }
}
