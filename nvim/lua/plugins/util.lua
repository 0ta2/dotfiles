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
    },

   {
       'reireias/vim-cheatsheet',
       config = function()
           vim.g['cheatsheet#cheat_file'] = vim.env.DOTFILES_PATH .. '/Doc/cheetsheet.md'
           vim.g["cheatsheet#float_window"] = 1
       end
   },

}
