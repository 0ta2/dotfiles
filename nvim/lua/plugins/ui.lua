return {
    -- bufferline
    {
        'akinsho/bufferline.nvim',
        event = "VeryLazy",
        version = "*",
        config = true,
        opts = {},
    },

    -- UIのコンポーネントライブラリー
    { "MunifTanjim/nui.nvim", lazy = true },

    -- icons
    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {},
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
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
