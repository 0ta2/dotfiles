return {
    { 'nvim-tree/nvim-web-devicons', lazy = true },

    {
        'nvim-tree/nvim-tree.lua',
        config = true,
        opts = {
            on_attach = function(bufnr)
                local opts = { buffer = bufnr }
                require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
                -- function for left to assign to keybindings
                local lefty = function()
                    local node_at_cursor = require("nvim-tree.api").tree.get_node_under_cursor()
                    -- if it's a node and it's open, close
                    if node_at_cursor.nodes and node_at_cursor.open then
                        require("nvim-tree.api").node.open.edit()
                        -- else left jumps up to parent
                    else
                        require("nvim-tree.api").node.navigate.parent()
                    end
                end
                -- function for right to assign to keybindings
                local righty = function()
                    local node_at_cursor = require("nvim-tree.api").tree.get_node_under_cursor()
                    -- if it's a closed node, open it
                    if node_at_cursor.nodes and not node_at_cursor.open then
                        require("nvim-tree.api").node.open.edit()
                    else
                        local current_line, current_column = unpack(vim.api.nvim_win_get_cursor(0))
                        print(current_line)
                        vim.api.nvim_win_set_cursor(0, { current_line + 1, current_column })
                    end
                end
                vim.keymap.set("n", "h", lefty, opts)
                vim.keymap.set("n", "<Left>", lefty, opts)
                vim.keymap.set("n", "<Right>", righty, opts)
                vim.keymap.set("n", "l", righty, opts)
            end,
        },
        keys = {
            { leader .. "e", "<cmd>NvimTreeFindFileToggle<CR>", desc = "toggle nvim-tree" },
        },
    }
}
