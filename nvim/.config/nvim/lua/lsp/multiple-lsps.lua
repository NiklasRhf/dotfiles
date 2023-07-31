local lsp = require("modules.nvim-lsp")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local nvim_lsp = require 'lspconfig'
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'vuels', 'tsserver', 'svelte', 'tailwindcss', 'kotlin_language_server'}
for _, server in ipairs(servers) do
  nvim_lsp[server].setup {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
