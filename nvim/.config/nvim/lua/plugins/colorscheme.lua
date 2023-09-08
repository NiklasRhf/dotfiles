return {
  "joshdick/onedark.vim",
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme onedark]])
    vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')
  end,
}

-- return {
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   config = function()
--     vim.cmd([[colorscheme gruvbox]])
--     vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')
--     vim.o.termguicolors = true
--     vim.o.background = "dark"
--   end,
-- }
