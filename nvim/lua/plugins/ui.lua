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
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
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
