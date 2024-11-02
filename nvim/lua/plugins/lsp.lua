local lsp_servers = {
    "lua_ls",
    "gopls",
    "pylsp",
    "rust_analyzer",
    "java_language_server",
    "terraformls",
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
        event = { "LspAttach" },
    },

    { "neovim/nvim-lspconfig" },

    { "williamboman/mason.nvim", config = true },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = lsp_servers
            }

            local handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end,
            }
            for _, lsp in ipairs(lsp_servers) do
                local ok, handler = pcall(require, "lsp." .. lsp)
                if ok then
                    handlers[lsp] = handler
                end
            end

            require("mason-lspconfig").setup_handlers(handlers)

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("LspConfig", {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                    local util = require("util")
                    local keymap = vim.keymap.set

                    -- vim.lsp
                    keymap("n", "gd", vim.lsp.buf.definition, util.ex_opts("Go to definition", ev.buf))
                    keymap('n', 'gD', vim.lsp.buf.declaration, util.ex_opts("Go to declaration", ev.buf))
                    keymap('n', 'gr', vim.lsp.buf.references, util.ex_opts('Go to references', ev.buf))
                    keymap('n', 'gi', vim.lsp.buf.implementation, util.ex_opts("Go to implementation", ev.buf))
                    keymap('n', leader .. 'a', vim.lsp.buf.code_action, util.ex_opts("Code Action", ev.buf))
                    keymap('n', 'K', vim.lsp.buf.hover, util.ex_opts("iHover", ev.buf))
                    keymap('n', leader .. 'K', vim.lsp.buf.signature_help, util.ex_opts("Signature help", ev.buf))
                    keymap('n', leader .. 'rn', vim.lsp.buf.rename, util.ex_opts("Rename", ev.buf))
                    keymap('n', leader .. 'f', function() vim.lsp.buf.format({ async = true }) end,
                        util.ex_opts("Format", ev.buf))
                    keymap('n', leader .. "dig", vim.diagnostic.setloclist, util.ex_opts("Open diagnostic", ev.buf))
                    keymap('n', '[d', vim.diagnostic.goto_prev, util.ex_opts("Go to prev diagnostic", ev.buf))
                    keymap('n', ']d', vim.diagnostic.goto_next, util.ex_opts("Go to next diagnostic", ev.buf))

                    -- Lspsaga
                    -- keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", util.ex_opts("Go to definition"), ev.buf)
                    -- keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", util.ex_opts("Peek definition"), ev.buf)
                    -- keymap('n', leader .. 'a', "<cmd>Lspsage code_action", util.ex_opts("Code Action"), ev.buf)

                    -- vim.keymap.set('n', leader .. 'dig', function() require("telescope.builtin").diagnostics() end, opts),
                    -- vim.keymap.set('n', 'gr', function() require("telescope.builtin").lsp_references({ include_current_line = true }) end, opts),
                    -- vim.keymap.set('n', 'gi', function() require("telescope.builtin").lsp_implementations() end, opts),
                end,
            })
        end,
    }
}
