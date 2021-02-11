local api = vim.api

local M = {}

function M.setup_settings()
   require('telescope').setup{
      defaults = {
         vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden'
         }
      }
   }
end

function M.setup_keymappings()
   local opts = { noremap = true, silent = true }
   api.nvim_set_keymap("n", leader .. "f", "<cmd>lua require('telescope.builtin').git_files{}<CR>", opts)
   api.nvim_set_keymap("n", leader .. "F", "<cmd>lua require('telescope.builtin').find_files{}<CR>", opts)
   api.nvim_set_keymap("n", leader .. "b", "<cmd>lua require('telescope.builtin').buffers{}<CR>", opts)
   api.nvim_set_keymap("n", leader .. "c", "<cmd>lua require('telescope.builtin').commands{}<CR>", opts)
   api.nvim_set_keymap("n", leader .. "r", "<cmd>lua require('telescope.builtin').live_grep{}<CR>", opts)
end

function M.init()
   M.setup_settings()
   M.setup_keymappings()
end

return M
