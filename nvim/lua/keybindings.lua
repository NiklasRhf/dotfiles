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
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- file explorer
keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)

-- better indenting
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- move selected line / block of text in visual mode
keymap('x', '<a-j>', ':m \'>+1<CR>gv=gv', opts)
keymap('x', '<a-k>', ':m \'<-2<CR>gv=gv', opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- telescope
keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
keymap('n', '<leader>fn', [[<cmd>lua require('telescope.builtin').find_files({ previewer = false })<CR>]], opts)
keymap('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], opts)
keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)
-- keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], opts)
keymap('n', '<leader>fw', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opts)
keymap('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], opts)
keymap('n', '<leader>fo', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opts)
keymap('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], opts)
keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], opts)
keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], opts)
keymap('n', '<leader>oo', [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]], opts)

-- Lsp settings
local lsp = {}
function lsp.on_attach(_, bufnr)
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
  buf_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  -- buf_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>lp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>fd', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], opts)
keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], opts)
keymap('n', '<leader>oo', [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]], opts)
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
  },
  g = {
    name = "Git",
    c = { "Commits" },
    b = { "Buffer Commits" },
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
  },
  o = {
    name = "Colorschemes",
    o = { "Show colorschemes" }
  },
}, { prefix = "<leader>", mode = "n", buffer = nil, silent = true, nowait = true })

return lsp
