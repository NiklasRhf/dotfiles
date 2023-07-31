local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'rust_analyzer',
  'tsserver',
  'eslint',
  'lua_ls',
})

lsp.skip_server_setup({ 'rust_analyzer' })

lsp.set_preferences({
  set_lsp_keymaps = false,
})

local lsp_keybindings = require('keybindings')
lsp.on_attach(function(_, bufnr)
  lsp_keybindings.on_attach(_, bufnr)
end)

lsp.nvim_workspace()

lsp.setup()

local cmp = require('cmp')
local cmp_custom = require('modules.nvim-cmp')
local cmp_config = lsp.defaults.cmp_config({
  formatting = cmp_custom.formatting,
  sources = cmp_custom.sources,
  snippet = cmp_custom.snippet,
  confirm_opts = cmp_custom.confirm_opts,
  mapping = cmp_custom.mapping,
})
cmp.setup(cmp_config)

local rust_lsp = lsp.build_options('rust_analyzer', {
  single_file_support = false,
  on_attach = function(_, _)
    print('hello rust-tools')
  end
})

local rust_opts = require('modules.rust-tools-opts')
rust_opts.server = rust_lsp
require('rust-tools').setup(rust_opts)

vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

--
-- local lsp = require('lsp-zero')
--
-- lsp.set_preferences({
--   suggest_lsp_servers = true,
--   setup_servers_on_start = true,
--   set_lsp_keymaps = false,
--   configure_diagnostics = true,
--   cmp_capabilities = false,
--   manage_nvim_cmp = false,
--   call_servers = 'local',
--   sign_icons = {
--     error = '✘',
--     warn = '▲',
--     hint = '⚑',
--     info = ''
--   }
-- })
--
-- lsp.ensure_installed({
--   'tsserver',
--   'eslint',
--   'sumneko_lua',
--   'rust_analyzer'
-- })
--
-- lsp.nvim_workspace()
--
-- lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
