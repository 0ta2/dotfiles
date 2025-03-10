local opts = { silent = true }

return {
    -- lazy
    { 'nvim-telescope/telescope-fzf-native.nvim',     build = 'make',     lazy = true },
    { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.1.0", lazy = true },
    { 'nvim-telescope/telescope-ghq.nvim',            lazy = true },
    { "nvim-telescope/telescope-ui-select.nvim",      lazy = true },
    { 'nvim-lua/plenary.nvim',                        lazy = true },

    {
        -- よく使うコマンドの登録プラグイン
        "DanWlker/toolbox.nvim",
        lazy = true,
        config = true,
        opts = {
            commands = {
                {
                    name = 'git blame',
                    execute = "Gitsigns blame"
                },
                {
                    name = "full text search",
                    execute = function()
                        local grug = require("grug-far")
                        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
                        grug.open({
                            transient = true,
                            prefills = {
                                filesFilter = ext and ext ~= "" and "*." .. ext or nil,
                            },
                        })
                    end
                },
                {
                    name = "change filetype",
                    execute = "Telescope filetypes"
                },
                {
                    name = "test summary toggle",
                    execute = 'lua require("neotest").summary.toggle()'
                },
            },
        },
        -- keys = { { leader .. "c", function() require("toolbox").show_picker() end, desc = "Search Toolbox", mode = { "n", "v" } } },
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',

        config = function()
            local telescope = require("telescope")
            telescope.setup {
                defaults = {
                    mappings = {
                        i = {
                            ['<esc>'] = require("telescope.actions").close
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {},
                    },
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    live_grep_args = {
                        mappings = {
                            i = {
                                ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                                ["<C-f>"] = require('telescope.actions').to_fuzzy_refine,
                            },
                        },
                    },
                }
            }

            telescope.load_extension("fzf")
            telescope.load_extension("ghq")
            telescope.load_extension("live_grep_args")
            telescope.load_extension("ui-select")
        end,

        keys = {
            -- telescope
            -- vim.keymap.set('n', '<c-p>',
            --     function() require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '--glob', '!.git', } }) end,
            --     opts),
            -- vim.keymap.set("n", "<c-g>", function() require("telescope").extensions.live_grep_args.live_grep_args() end,
                -- opts),
            -- vim.keymap.set('n', '<c-t>', function() require("telescope.builtin").buffers() end, opts),
            vim.keymap.set('n', leader .. 'C', function() require("telescope.builtin").commands() end, opts),
            -- git
            vim.keymap.set('n', leader .. 'gs', function() require("telescope.builtin").git_status() end, opts),
        },
    },
}
