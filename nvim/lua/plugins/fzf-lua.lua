local opts = { silent = true }

return {
    "ibhagwan/fzf-lua",
    config = function()
        require("fzf-lua").setup({})
    end,

    keys = {
        { "<c-p>", "<cmd>FzfLua files<CR>", desc = "files" },
    }
}
