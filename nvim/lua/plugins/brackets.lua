return {
    {
        "hrsh7th/nvim-insx",
        config = function ()
            require('insx.preset.standard').setup()
        end
    },

    -- カッコ編集の効率化プラグイン
    { "tpope/vim-surround" },

    {
        -- カッコの移動強化プラグイン
        "andymass/vim-matchup",
        setup = function ()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    }
}
