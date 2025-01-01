return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        keys = {
            {
                leader .. "e",
                function()
                    require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
                end,
                desc = "Explorer NeoTree",
            },
        },
        opts = {
            sources = { "filesystem", "buffers", "git_status" },
            open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
            default_component_configs = {
                indent = {
                    with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                git_status = {
                    symbols = {
                        unstaged = "󰄱",
                        staged = "󰱒",
                    },
                },
            },
            window = {
                position = "left",
                mappings = {
                    ["l"] = "open",
                    ["h"] = "close_node",
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                },
                follow_current_file = {
                    enabled = true,
                },
            }
        },
    },

    -- search/replace in multiple files
    {
        "MagicDuck/grug-far.nvim",
        opts = { headerMaxWidth = 80 },
        cmd = "GrugFar",
        keys = {
            {
                leader .. "sr",
                -- TODO: toolboxの処理と同じなので、処理を切り出して共通化する。
                function()
                    local grug = require("grug-far")
                    local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
                    grug.open({
                        transient = true,
                        prefills = {
                            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
                        },
                    })
                end,
                mode = { "n", "v" },
                desc = "Search and Replace",
            },
        },
    },


    {
        -- Gitの変更状態を表示
        "lewis6991/gitsigns.nvim",
        config = true,
        opts = {
            current_line_blame = true,
        }
    },

    {
        -- Gitの操作
        "NeogitOrg/neogit",
        dependencies = {
            "sindrets/diffview.nvim", lazy = true,
        },
        config       = true,
        opts         = {
            integrations = {
                diffview = true,
                fzf_lua = true,
            },
        },
        cmd          = {
            "Neogit",
            "NeogitLogCurrent",
            "NeogitCommit",
        }
    },
}
