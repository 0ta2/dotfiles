local opts = { silent = true }

return {
    "ibhagwan/fzf-lua",
    config = function()
        require("fzf-lua").setup({})
    end,

    keys = {
        { "<C-p>", "<cmd>FzfLua files<CR>", desc = "files" },
        { "<C-g>", "<cmd>FzfLua live_grep<CR>", desc = "live_grep" },
        { "<C-t>", "<cmd>FzfLua buffers<CR>", desc = "buffers" },
        { leader .. "c", "<cmd>FzfLua commands<CR>", desc = "commands" },
    }
}
