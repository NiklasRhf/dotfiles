return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    { 'williamboman/mason.nvim' }, -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' }, -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' }, -- Required
  },
  config = function()
    local lsp = require('lsp-zero')

    lsp.preset('lsp-only')
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

    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap
    lsp.on_attach(function(_, bufnr)
      opts.buffer = bufnr
      opts.desc = "Go to declaration"
      keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
      keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
      keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
      keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)
      keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      keymap.set('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      keymap.set('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      keymap.set('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      keymap.set('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      --keymap.set(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
      -- keymap.set(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
      keymap.set('n', '<leader>lp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
      keymap.set('n', '<leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
      keymap.set('n', '<leader>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
      keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
      keymap.set('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
      vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
    end)

    lsp.nvim_workspace()
    lsp.setup()

    local rust_lsp = lsp.build_options('rust_analyzer', {
      single_file_support = false,
      on_attach = function(_, bufnr)
        vim.keymap.set("n",
          "<leader>ra",
          [[<cmd>lua require("rust-tools").hover_actions.hover_actions()<CR><cmd>lua require("rust-tools").hover_actions.hover_actions()<CR>]]
          ,
          { desc = "Rust hover actions" },
          { buffer = bufnr })
        vim.keymap.set("n",
          "<leader>rg",
          [[<cmd>lua require("rust-tools").code_action_group.code_action_group()<CR><cmd>lua require("rust-tools").code_action_group.code_action_group()<CR>]]
          ,
          { desc = "Rust hover actions group" },
          { buffer = bufnr })
        vim.keymap.set('n',
          '<leader>re',
          [[<cmd>lua require('rust-tools').inlay_hints.enable()<CR>]],
          { desc = "Enable inlay hints" },
          { buffer = bufnr })
        vim.keymap.set('n',
          '<leader>rd',
          [[<cmd>lua require('rust-tools').inlay_hints.disable()<CR>]],
          { desc = "Disable inlay hints" },
          { buffer = bufnr })
      end
    })

    local rust_config = require('plugins.config.rust-tools')
    rust_config.server = rust_lsp
    require('rust-tools').setup(rust_config)

    -- Diagnostics
    vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = false,
      float = true,
    })
  end
}
