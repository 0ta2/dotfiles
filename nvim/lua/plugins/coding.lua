return {
    {
        'saghen/blink.cmp',
        version = 'v0.*',
        event = 'InsertEnter',
        dependencies = 'rafamadriz/friendly-snippets',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'super-tab' },

            appearance = {
                use_nvim_cmp_as_default = true,
            },

            sources = {
                completion = {
                    enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
                },
            },

            -- experimental auto-brackets support
            completion = { accept = { auto_brackets = { enabled = true } } },

            -- experimental signature help support
            signature = { enabled = true },
        },

        opts_extend = { "sources.completion.enabled_providers" }
    },

    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { "string" },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
        },
    },

    {
        "folke/lazydev.nvim",
        ft = { "lua" },
        cmd = { "LazyDev" },
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
                { path = "LazyVim",            words = { "LazyVim" } },
                { path = "lazy.nvim",          words = { "LazyVim" } },
            }
        }
    },

    -- Manage libuv types with lazy. Plugin will never be loaded
    { "Bilal2453/luvit-meta", lazy = true },
}
