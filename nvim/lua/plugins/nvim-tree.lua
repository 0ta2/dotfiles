return {
    { 'nvim-tree/nvim-web-devicons', lazy = true },

    {
        'nvim-tree/nvim-tree.lua',
        config = true,
        keys = {
            {leader .. "e", "<cmd>NvimTreeToggle<CR>", desc = "toggle nvim-tree"},
        },
        opts = {},
    }
}
