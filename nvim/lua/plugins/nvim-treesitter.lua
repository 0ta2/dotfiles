return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    ft = {
        "lua",
        "go",
        "toml",
        "php",
        'javascript',
        'html',
        'css',
        'terraform',
    },
    opts = {
        sync_install = false,
        ensure_installed = {
            'lua',
            'go',
            'toml',
            'php',
            'phpdoc',
            'javascript',
            'html',
            'css',
            'terraform',
        },
        highlight = {
            enable = true,
            disable = {}
        },
        indent = {
            enable = true,
        },
        -- vim-matchup
        matchup = {
            enable = true,
        }
    },
    config = function()
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldlevel = 99
    end,
}
