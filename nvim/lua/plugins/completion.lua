return {
    {'rafamadriz/friendly-snippets', lazy = true},

    {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = 'rafamadriz/friendly-snippets',

        version = 'v0.*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = "super-tab",
            highlight = {
                use_nvim_cmp_as_default = true,
            },
            nerd_font_variant = 'normal',
            accept = { auto_brackets = { enabled = true } },
            trigger = { signature_help = { enabled = true } }
        }
    }
}
