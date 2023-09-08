local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- leader
keymap('n', '<Space>', '<NOP>', opts)

-- file saving
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

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

-- better indenting
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- move selected line / block of text in visual mode
keymap('x', '<a-j>', ':m \'>+1<CR>gv=gv', opts)
keymap('x', '<a-k>', ':m \'<-2<CR>gv=gv', opts)

-- git
keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], opts)
keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], opts)
keymap('n', '<leader>gn', [[<cmd>Gitsigns next_hunk<CR>]], opts)
keymap('n', '<leader>gp', [[<cmd>Gitsigns prev_hunk<CR>]], opts)
keymap('n', '<leader>gh', [[<cmd>Gitsigns preview_hunk<CR>]], opts)
keymap('n', '<leader>gd', [[<cmd>Gitsigns diffthis<CR>]], opts)

--trouble
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

-- ChatGPT
keymap('n', '<leader>ac', [[<cmd>lua require('chatgpt').openChat()<CR>]], opts)
keymap('n', '<leader>ae', [[<cmd>lua require('chatgpt').edit_with_instructions()<CR>]], opts)
keymap('n', '<leader>ap', [[<cmd>lua require('chatgpt').selectAwesomePrompt()<CR>]], opts)
--keymap('n', '<leader>ak', [[<cmd>e ~/.config/nvim/lua/keybindings.lua<CR><cmd>:148<CR>]], opts)
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

-- wk.register({
--   f = {
--     name = "Find",
--     f = { "Find file" },
--     n = { "Find file without preview" },
--     b = { "Find buffer" },
--     c = { "Find string in current buffer" },
--     h = { "Find help tags" },
--     w = { "Find string under cursor in files" },
--     s = { "Find string in files" },
--     t = { "Find tags in current buffer" },
--     o = { "Find old files" },
--     d = { "Find symbols in document" },
--     p = { "Find projects" },
--   },
--   g = {
--     name = "Git",
--     c = { "Commits" },
--     b = { "Buffer Commits" },
--     n = { "Next hunk" },
--     p = { "Prevous hunk" },
--     h = { "Preview hunk" },
--     d = { "Diff" },
--   },
--   e = {
--     name = "Explorer",
--   },
--   D = {
--     name = "Type definition",
--   },
--   q = {
--     name = "Location list",
--   },
--   c = {
--     name = "Code",
--     a = { "Code action" },
--     d = { "Code diagnostics" },
--     p = { "Previous diagnostic" },
--     n = { "Next diagnostic" },
--     r = { "Rename" },
--   },
--   h = {
--     name = "Gitsigns",
--   },
--   l = {
--     name = "LSP",
--     f = { "Format code" },
--     n = { "Goto next diagnostic" },
--     p = { "Goto previous diagnostic" },
--     q = { "Show diagnostic list" },
--     r = { "Show references" },
--     K = { "Show docs" },
--     s = { "Show signature" },
--     c = { "Show colors" },
--   },
--   o = {
--     name = "Colorschemes",
--     o = { "Show colorschemes" }
--   },
--   t = {
--     name = "Trouble",
--     t = "Toggle",
--     d = "Document diagnostics",
--     q = "Quickfix",
--     l = "LocList",
--   },
--   d = {
--     name = "Debugging",
--     u = "Open UI",
--     b = "Toggle Breakpoint",
--     B = "Set Breakpoint (Breakpoint Condition)",
--     l = "Set Breakpoint (Log point message)",
--     r = "Open Repl",
--     L = "Run last",
--     c = "Continue",
--     o = "Step over",
--     i = "Step into",
--     t = "Step out",
--   },
--   b = {
--     name = "Buffers",
--   },
--   r = {
--     name = "Rust Tools",
--     e = "Enable inlay hints",
--     d = "Disable inlay hints",
--     p = "Parent module",
--     h = "Hover actions",
--   },
--   a = {
--     name = "ChatGPT",
--     c = "Open prompt",
--     e = "Edit with instructions",
--     p = "Act as",
--     k = "Keymaps",
--     a = {
--       name = "Run action",
--       c = "Complete code",
--     }
--   }
-- }, { prefix = "<leader>", mode = "n", buffer = nil, silent = true, nowait = true })

return lsp
