return function ()
    local lspconfig = require("lspconfig")
    lspconfig.terraformls.setup {
        -- https://github.com/neovim/neovim/issues/30675 
        offset_encoding = "utf-8",
    }
end
