-- omnisharp lsp config
local lsp = require("modules.nvim-lsp")
local pid = vim.fn.getpid()
local omnisharp_bin = "/home/niklas/Downloads/omnisharp/OmniSharp"

require 'lspconfig'.omnisharp.setup {
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
  cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
}
