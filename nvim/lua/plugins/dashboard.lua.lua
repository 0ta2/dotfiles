return {
    {
        { "echasnovski/mini.icons", lazy = true },

        {
            'goolord/alpha-nvim',
            config = function()
                local alpha = require("alpha")
                local dashboard = require("alpha.themes.dashboard")

                -- Set header
                dashboard.section.header.val = {
                    "                                                     ",
                    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                    "                                                     ",
                }

                -- Set menu
                dashboard.section.buttons.val = {
                    dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
                    dashboard.button("f", " " .. " Project", ":Telescope ghq<CR>"),
                    dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
                    dashboard.button("m", " " .. " Mason", ":Mason<CR>"),
                    dashboard.button("n", "󰊢" ..  " Neogit", ":Neogit<CR>"),
                    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
                }

                -- Set footer
                local version = vim.version()
                dashboard.section.footer.val = {
                    os.date(" %Y-%m-%d   %H:%M:%S") ..
                    "  v" .. version.major .. "." .. version.minor .. "." .. version.patch
                }

                -- Send config to alpha
                alpha.setup(dashboard.opts)

                -- Disable folding on alpha buffer
                vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
            end
        },
    },

}
