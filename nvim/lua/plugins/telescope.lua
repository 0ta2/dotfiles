local opts = { silent = true }

return {
    -- lazy
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = true },
    { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.1.0", lazy = true},
    { 'nvim-telescope/telescope-ghq.nvim', lazy = true },
    { 'nvim-lua/plenary.nvim', lazy = true },

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
                },
            }

            telescope.load_extension("fzf")
            telescope.load_extension("ghq")
            telescope.load_extension("live_grep_args")
        end,

        keys = {
            -- telescope
            vim.keymap.set('n', '<c-p>', function() require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '--glob', '!.git', }}) end, opts),
            vim.keymap.set("n", "<c-g>", function() require("telescope").extensions.live_grep_args.live_grep_args() end, opts),
            vim.keymap.set('n', '<c-t>', function() require("telescope.builtin").buffers() end, opts),
            vim.keymap.set('n', leader .. 'c', function() require("telescope.builtin").commands() end, opts),
            -- git
            vim.keymap.set('n', leader .. 'gs', function() require("telescope.builtin").git_status() end, opts),
            -- lsp
            vim.keymap.set('n', leader .. 'dig', function() require("telescope.builtin").diagnostics() end, opts),
            vim.keymap.set('n', 'gr', function() require("telescope.builtin").lsp_references({ include_current_line = true }) end, opts),
            vim.keymap.set('n', 'gi', function() require("telescope.builtin").lsp_implementations() end, opts),
        },
    },
}
