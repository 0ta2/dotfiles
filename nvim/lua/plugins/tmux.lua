return {
    {
        'christoomey/vim-tmux-navigator',
        cnfig = function()
            local api = vim.api
            vim.g.tmux_navigator_no_mappings = 1
            vim.g.tmux_navigator_save_on_switch = 2
            vim.g.tmux_navigator_no_mappings = 1

            local opts = { silent = true }
            vim.keymap.set('n', '<C-S-h>', [[:<C-u>TmuxNavigateLeft <CR>]], opts)
            vim.keymap.set('n', '<C-S-j>', [[:<C-u>TmuxNavigateDown <CR>]], opts)
            vim.keymap.set('n', '<C-S-k>', [[:<C-u>TmuxNavigateUp <CR>]], opts)
            vim.keymap.set('n', '<C-S-l>', [[:<C-u>TmuxNavigateRight <CR>]], opts)
            vim.keymap.set('n', '<C-S-\\>', [[:<C-u>TmuxNavigatePrevious <CR>]], opts)
        end
    },
}
