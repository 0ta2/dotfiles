return {
    -- 画面上のカラーコードを可視化
    { "gko/vim-coloresque" },

    {
        -- 末尾の無駄なスペースの可視化
        "bronson/vim-trailing-whitespace",
        config = function ()
            vim.g.extra_whitespace_ignored_filetypes = {
                'help',
                'lspsagafinder',
                'TelescopePrompt',
                'HopChar',
                'NeogitPopup',
                'NeogitStatus',
                'mason',
                'alpha',
            }
        end
    }

}
