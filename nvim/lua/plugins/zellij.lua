return {
    "GR3YH4TT3R93/zellij-nav.nvim",
    cond = os.getenv("ZELLIJ") == "0",
    -- event = "VeryLazy",                           -- Lazy load plugin for improved startup times
    init = function()
        vim.g.zellij_nav_default_mappings = false
    end,
    config = function()
        require("zellij-nav").setup()
        vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>ZellijNavigateLeft<CR>", { silent = true })
        vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>ZellijNavigateDown<CR>", { silent = true })
        vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>ZellijNavigateUp<CR>", { silent = true })
        vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>ZellijNavigateRight<CR>", { silent = true })
    end,
}
