local lsp = require("modules.nvim-lsp")

require('rust-tools').setup({
    server = {
        on_attach = lsp.on_attach,
        capabilities = lsp.capabilities,
    }
})
