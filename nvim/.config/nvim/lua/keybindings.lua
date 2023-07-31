local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local wk = require("which-key")

-- leader
keymap('n', '<Space>', '<NOP>', opts)

-- file saving
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- change colorscheme
keymap('n', '<leader>oo', [[<cmd>lua vim.cmd "colorscheme onedark"<cr>]], opts)
keymap('n', '<leader>og', [[<cmd>lua vim.cmd "colorscheme gruvbox"<cr>]], opts)


-- general keys
keymap('n', 'ö', '{', {})
keymap('i', 'ö', '{', {})
keymap('n', 'ä', '}', {})
keymap('i', 'ä', '}', {})
keymap('n', 'Ö', '[', {})
keymap('i', 'Ö', '[', {})
keymap('n', 'Ä', ']', {})
keymap('i', 'Ä', ']', {})
keymap('i', 'jk', '<Esc>', {})
keymap('i', 'kj', '<Esc>', {})
keymap('i', '<c-c>', '<Esc>', {})
keymap('n', '<Insert>', '"*p', {})

-- window management
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
keymap('n', '<Leader>wv', ':vsp<CR>', opts)
keymap('n', '<Leader>wh', ':sp<CR>', opts)
keymap('n', '<Leader>wq', ':q<CR>', opts)

-- esize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<Leader>rr", ":vertical resize -2<CR>", opts)
keymap("n", "<Leader>rl", ":vertical resize +2<CR>", opts)

-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


-- file explorer
keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)

-- better indenting
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- move selected line / block of text in visual mode
keymap('x', '<a-j>', ':m \'>+1<CR>gv=gv', opts)
keymap('x', '<a-k>', ':m \'<-2<CR>gv=gv', opts)

-- Navigate buffers
--keymap("n", "<S-l>", ":bnext<CR>", opts)
--keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", "<Plug>(CybuNext)", opts)
keymap("n", "<S-h>", "<Plug>(CybuPrev)", opts)

-- telescope
keymap('n', '<leader>fb',
  [[<cmd>lua require('telescope.builtin').buffers({ previewer = false, layout_strategy = 'vertical', layout_config = { width = 0.4, height = 0.7 } })<CR>]]
  , opts)
keymap('n', '<leader>ff',
  [[<cmd>lua require('telescope.builtin').find_files({ previewer = false, layout_strategy = 'vertical', layout_config = { width = 0.4, height = 0.7 } })<CR>]]
  , opts)
keymap('n', '<leader>fn', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
keymap('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], opts)
keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)
keymap('n', '<leader>fp',
  [[<cmd>lua require('telescope').extensions.repo.list{file_ignore_patterns={"/%.cache/", "/%.cargo/", "/%.local/", "AppData/"}}<CR>]]
  , opts)
-- keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], opts)
keymap('n', '<leader>fw', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opts)
keymap('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], opts)
keymap('n', '<leader>fo', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opts)
keymap('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], opts)
keymap('n', '<leader>oo', [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]], opts)
keymap('n', '<Leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)

-- git
keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], opts)
keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], opts)
keymap('n', '<leader>gn', [[<cmd>Gitsigns next_hunk<CR>]], opts)
keymap('n', '<leader>gp', [[<cmd>Gitsigns prev_hunk<CR>]], opts)
keymap('n', '<leader>gh', [[<cmd>Gitsigns preview_hunk<CR>]], opts)
keymap('n', '<leader>gd', [[<cmd>Gitsigns diffthis<CR>]], opts)

keymap('n', '<leader>tt', [[<cmd>TroubleToggle<CR>]], opts)
keymap('n', '<leader>td', [[<cmd>TroubleToggle document_diagnostics<CR>]], opts)
keymap('n', '<leader>tq', [[<cmd>TroubleToggle quickfix<CR>]], opts)
keymap('n', '<leader>tl', [[<cmd>TroubleToggle loclist<CR>]], opts)

--dap debugging
keymap('n', '<F5>', [[<cmd>lua require'dap'.continue()<CR>]], opts)
keymap('n', '<F10>', [[<cmd>lua require'dap'.step_over()<CR>]], opts)
keymap('n', '<F11>', [[<cmd>lua require'dap'.step_into()<CR>]], opts)
keymap('n', '<F12>', [[<cmd>lua require'dap'.step_out()<CR>]], opts)
keymap('n', '<leader>dc', [[<cmd>lua require'dap'.continue()<CR>]], opts)
keymap('n', '<leader>do', [[<cmd>lua require'dap'.step_over()<CR>]], opts)
keymap('n', '<leader>di', [[<cmd>lua require'dap'.step_into()<CR>]], opts)
keymap('n', '<leader>dt', [[<cmd>lua require'dap'.step_out()<CR>]], opts)
keymap('n', '<Leader>db', [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]], opts)
keymap('n', '<Leader>dB', [[<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], opts)
keymap('n', '<Leader>dl', [[<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))()<CR>]],
  opts)
keymap('n', '<Leader>dr', [[<cmd>lua require'dap'.repl.open()<CR>]], opts)
keymap('n', '<Leader>dL', [[<cmd>lua require'dap'.run_last()<CR>]], opts)
keymap('n', '<Leader>du', [[<cmd>lua require'dapui'.toggle()<CR>]], opts)

-- lspsaga
--keymap('n', '<Leader>ca', [[<cmd>lua require'lspsaga.codeaction'.code_action()<CR>]], opts)
--keymap('v', '<leader>ca', [[<cmd>lua require'lspsaga.codeaction'.range_code_action()<CR>]], opts)
keymap('n', '<leader>ca', [[<cmd>lua vim.lsp.buf.code_action()<CR>]], opts)
--keymap('n', '<leader>cd', [[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], opts)
keymap('n', '<leader>cd', [[<cmd>lua vim.diagnostic.open_float()<CR>]], opts)
keymap('n', '<leader>cn', [[<cmd>lua require'lspsaga.diagnostic'.goto_next()<CR>]], opts)
keymap('n', '<leader>cp', [[<cmd>lua require'lspsaga.diagnostic'.goto_prev()<CR>]], opts)
keymap('n', '<leader>cr', [[<cmd>lua require'lspsaga.rename'.lsp_rename()<CR>]], opts)
keymap('n', '<leader>lK', [[<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>]], opts)
keymap('n', '<leader>ls', [[<cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>]], opts)
keymap('n', '<leader>lc', [[<cmd>ColorizerToggle<CR>]], opts)

-- Rust tools
keymap('n', '<leader>re', [[<cmd>lua require('rust-tools').inlay_hints.enable()<CR>]], opts)
keymap('n', '<leader>rd', [[<cmd>lua require('rust-tools').inlay_hints.disable()<CR>]], opts)
keymap('n', '<leader>rh', [[<cmd>lua require('rust-tools').hover_actions.hover_actions()<CR>]], opts)
keymap('n', '<leader>rp', [[<cmd>lua require('rust-tools').parent_module.parent_module()<CR>]], opts)

-- ChatGPT
keymap('n', '<leader>ac', [[<cmd>lua require('chatgpt').openChat()<CR>]], opts)
keymap('n', '<leader>ae', [[<cmd>lua require('chatgpt').edit_with_instructions()<CR>]], opts)
keymap('n', '<leader>ap', [[<cmd>lua require('chatgpt').selectAwesomePrompt()<CR>]], opts)
keymap('n', '<leader>ak', [[<cmd>e ~/.config/nvim/lua/keybindings.lua<CR><cmd>:148<CR>]], opts)
keymap('v', '<leader>aac', [[<cmd>ChatGPTRun complete_code<CR>]], opts)
keymap('v', '<a-c>', [[<cmd>ChatGPTRun complete_code<CR>]], opts)
-- close = { "<C-c>" },
-- yank_last = "<C-y>",
-- yank_last_code = "<C-k>",
-- scroll_up = "<C-u>",
-- scroll_down = "<C-d>",
-- new_session = "<C-n>",
-- cycle_windows = "<Tab>",
-- cycle_modes = "<C-f>",
-- select_session = "<Space>",
-- rename_session = "r",
-- delete_session = "d",
-- draft_message = "<C-d>",
-- toggle_settings = "<C-o>",
-- toggle_message_role = "<C-r>",
-- toggle_system_role_open = "<C-s>",

-- Lsp settings
local lsp = {}
function lsp.on_attach(_, bufnr)
  print("lsp.on_attach in keybindings")
  local buf_keymap = vim.api.nvim_buf_set_keymap
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --buf_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  -- buf_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>lp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>fd', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

wk.register({
  f = {
    name = "Find",
    f = { "Find file" },
    n = { "Find file without preview" },
    b = { "Find buffer" },
    c = { "Find string in current buffer" },
    h = { "Find help tags" },
    w = { "Find string under cursor in files" },
    s = { "Find string in files" },
    t = { "Find tags in current buffer" },
    o = { "Find old files" },
    d = { "Find symbols in document" },
    p = { "Find projects" },
  },
  g = {
    name = "Git",
    c = { "Commits" },
    b = { "Buffer Commits" },
    n = { "Next hunk" },
    p = { "Prevous hunk" },
    h = { "Preview hunk" },
    d = { "Diff" },
  },
  e = {
    name = "Explorer",
  },
  D = {
    name = "Type definition",
  },
  q = {
    name = "Location list",
  },
  c = {
    name = "Code",
    a = { "Code action" },
    d = { "Code diagnostics" },
    p = { "Previous diagnostic" },
    n = { "Next diagnostic" },
    r = { "Rename" },
  },
  h = {
    name = "Gitsigns",
  },
  l = {
    name = "LSP",
    f = { "Format code" },
    n = { "Goto next diagnostic" },
    p = { "Goto previous diagnostic" },
    q = { "Show diagnostic list" },
    r = { "Show references" },
    K = { "Show docs" },
    s = { "Show signature" },
    c = { "Show colors" },
  },
  o = {
    name = "Colorschemes",
    o = { "Show colorschemes" }
  },
  t = {
    name = "Trouble",
    t = "Toggle",
    d = "Document diagnostics",
    q = "Quickfix",
    l = "LocList",
  },
  d = {
    name = "Debugging",
    u = "Open UI",
    b = "Toggle Breakpoint",
    B = "Set Breakpoint (Breakpoint Condition)",
    l = "Set Breakpoint (Log point message)",
    r = "Open Repl",
    L = "Run last",
    c = "Continue",
    o = "Step over",
    i = "Step into",
    t = "Step out",
  },
  b = {
    name = "Buffers",
  },
  r = {
    name = "Rust Tools",
    e = "Enable inlay hints",
    d = "Disable inlay hints",
    p = "Parent module",
    h = "Hover actions",
  },
  a = {
    name = "ChatGPT",
    c = "Open prompt",
    e = "Edit with instructions",
    p = "Act as",
    k = "Keymaps",
    a = {
      name = "Run action",
      c = "Complete code",
    }
  }
}, { prefix = "<leader>", mode = "n", buffer = nil, silent = true, nowait = true })

return lsp
