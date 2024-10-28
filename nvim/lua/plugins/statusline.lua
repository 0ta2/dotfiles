return {
    { "nvim-tree/nvim-web-devicons", lazy = true },

    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = 'gruvbox-material',
            },
            extensions = {
                -- "trouble",
                "fzf",
                "nvim-tree",
                "mason",
            }

        }
    }
}
