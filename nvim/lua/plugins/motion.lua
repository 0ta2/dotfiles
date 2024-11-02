return {
    {
        'smoka7/hop.nvim',
        event = "BufRead",
        version = "*",
        opts = {
            keys = 'etovxqpdygfblzhckisuran',
            multi_windows = true,
        },
        keys = {
            {"fs", function() require("hop").hint_char1() end, desc = "Go to HopChar1"}
        },
    }
}
