local enabole_file_type = {
    "lua",
    "go",
    "toml",
    "php",
    "javascript",
    "html",
    "css",
    "terraform",
}

return {
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = true,
        ft = enabole_file_type,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        ft = enabole_file_type,
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                sync_install = false,

                ensure_installed = {
                    "lua",
                    "go",
                    "toml",
                    "php",
                    "phpdoc",
                    "javascript",
                    "html",
                    "css",
                    "terraform",
                },
                highlight = {
                    enable = true,
                    disable = {}
                },
                indent = {
                    enable = true,
                },
                -- vim-matchup
                matchup = {
                    enable = true,
                }
            })

            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldlevel = 99
        end,
    }
}
