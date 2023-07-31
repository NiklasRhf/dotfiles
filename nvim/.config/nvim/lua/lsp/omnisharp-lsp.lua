-- omnisharp lsp config
local lsp = require("modules.nvim-lsp")
local pid = vim.fn.getpid()
-- local omnisharp_bin = "/home/niklas/Downloads/omnisharp/OmniSharp"
local omnisharp_bin = "C:\\Users\\nre\\Downloads\\omnisharp-win-x64-net6.0\\OmniSharp.exe"

require 'lspconfig'.omnisharp.setup {
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
  cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
}
