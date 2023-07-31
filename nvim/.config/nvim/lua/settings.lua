vim.o.fileencoding = "utf-8"
-- Set leader and timeout
vim.g.mapleader = ' '
vim.o.timeoutlen = 150

vim.g.copilot_assume_mapped = true
--vim.g.copilot_no_tab_map = false
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true  })

-- Show line numbers
vim.wo.relativenumber = true
-- vim.o.cursorline = true

-- vim.o.autoindent = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.expandtab = true

function change_filetype_workaround()
  if filetype() == "xaml" then
    vim.bo.filetype = "xml"
  end
end

filetype = function()
  local str = vim.fn.expand('%')
  return str:match("[^.]+$")
end


--vim.api.nvim_create_autocmd("VimEnter", { command = "source ~/AppData/Local/nvim/lua/modules/bufferline.lua", })
vim.api.nvim_create_autocmd("BufWritePre *.cs", { command = "lua vim.lsp.buf.format({ async = true })", })
vim.api.nvim_create_autocmd("BufRead,BufNewFile *.xaml", { command = "lua change_filetype_workaround()", })

-- au BufRead,BufNewFile *.xaml set filetype=xml

-- Autoformat rust files
--vim.cmd [[autocmd BufWritePre *.rs, *.cs, *.json lua vim.lsp.buf.format({ async = true })]]
--vim.cmd [[autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.css,*.scss,*.json,*.html,*.md,*.vue,*.yml,*.xml,*.cs Neoformat]]
--vim.g.neoformat_try_node_exe = 1

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
-- vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.o.wrap = false

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.vscode_style = "dark"
vim.g.tokyonight_style = "storm"
--vim.g.onedark_terminal_italics = 2
--vim.g.gruvbox_terminal_italics = 0
--vim.cmd [[colorscheme gruvbox]]
vim.cmd [[colorscheme onedark]]
vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.opt.shortmess:append "c"

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]] ,
  false
)

