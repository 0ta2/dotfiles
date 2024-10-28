return function ()
    local lspconfig = require("lspconfig")
    lspconfig.terraformls.setup {
        capabilities = {
            textDocument = {
                semanticTokens = nil,
            },
        },
    }
end
