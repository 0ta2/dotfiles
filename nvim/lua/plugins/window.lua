return {
    'simeji/winresizer',
    lazy = true,
    keys = {
        { "<C-e>", "<cmd>WinResizerStartResize<CR>", desc = "Resize Window" },
    },
    config = function ()
        vim.g.winresizer_vert_resize = 5
        vim.g.winresizer_horiz_resize = 5
    end
}
