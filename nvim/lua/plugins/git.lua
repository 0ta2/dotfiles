return {
    -- lazy
    { "nvim-lua/plenary.nvim",  lazy = true },
    { "sindrets/diffview.nvim", lazy = true },

    {
        "lewis6991/gitsigns.nvim",
        config = true,
    },

    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config       = true,
        opts         = {},
        cmd          = { "Neogit" }
    },
}
