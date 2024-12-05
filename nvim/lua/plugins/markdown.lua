return {
    {
        'previm/previm',
        ft = { 'md', 'markdown' },
        dependencies = {
            'tyru/open-browser.vim'
        }
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        ft = {
            "md",
            "markdown",
        },
        opts = {},
    }
}
