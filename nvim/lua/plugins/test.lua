return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "antoinemadec/FixCursorHold.nvim",
            { "fredrikaverpil/neotest-golang", version = "*" },
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-golang"), -- Registration
                },
            })
        end,
    },
    {
        "buoto/gotests-vim",
        config = function ()
            vim.g.gotests_bin = vim.env.GOBIN .. "/gotest"
        end
    }
}
