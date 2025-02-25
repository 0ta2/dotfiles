return {
    "rcarriga/nvim-dap-ui",
    init = function()
        -- dap の signcolumn の変更
        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "󰉥", texthl = "", linehl = "", numhl = "", })
        vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })
    end,
    opts = {
        controls = {
            icons = {
                disconnect = "⏻",
            },
        }
    },
    dependencies = {
        "mfussenegger/nvim-dap",
        {
            "leoluz/nvim-dap-go",
            config = function()
                require('dap-go').setup()
            end
        },
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {}
        },
    },
}
