local lspsaga_status_ok, lspsaga = pcall(require, "lspsaga")
if not lspsaga_status_ok then
  return
end

local lspsaga_kind_status_ok, lspsaga_kind = pcall(require, "lspsaga.lspkind")
if not lspsaga_kind_status_ok then
  return
end

-- change the lsp symbol kind
--lspsaga_kind[type_number][2] = icon -- see lua/lspsaga/lspkind.lua

lspsaga.init_lsp_saga({
  -- Options with default value
  -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = "single",
  --the range of 0 for fully opaque window (disabled) to 100 for fully
  --transparent background. Values between 0-30 are typically most useful.
  saga_winblend = 0,
  -- when cursor in saga window you config these to move
  move_in_saga = { prev = '<C-p>',next = '<C-n>'},
  -- Error, Warn, Info, Hint
  -- and diagnostic_header can be a function type
  -- must return a string and when diagnostic_header
  -- is function type it will have a param `entry`
  -- entry is a table type has these filed
  -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  -- show diagnostic source
  show_diagnostic_source = true,
  -- add bracket or something with diagnostic source, just have 2 elements
  diagnostic_source_bracket = {},
  -- use emoji lightbulb in default
  code_action_icon = "💡",
  -- if true can press number to execute the codeaction in codeaction window
  code_action_num_shortcut = true,
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
      enable = false,
      sign = true,
      sign_priority = 20,
      virtual_text = true,
  },
  -- finder icons
  finder_icons = {
    def = '  ',
    ref = '諭 ',
    link = '  ',
  },
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 30,
  -- finder_action_keys = {
  --     open = "o",
  --     vsplit = "s",
  --     split = "i",
  --     tabe = "t",
  --     quit = "q",
  --     scroll_down = "<C-f>",
  --     scroll_up = "<C-b>", -- quit can be a table
  -- },
  code_action_keys = {
      quit = "q",
      exec = "<CR>",
  },
  rename_action_quit = "<C-c>",
  definition_preview_icon = "  ",
  -- show symbols in winbar must nightly
  symbol_in_winbar = {
      in_custom = false,
      enable = false,
      separator = ' ',
      show_file = true,
      click_support = false,
  },
  -- show outline
  show_outline = {
    win_position = 'right',
    -- set the special filetype in there which in left like nvimtree neotree defx
    left_with = '',
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = { metals = { "sbt", "scala" } }
  server_filetype_map = {},
})

-- onedark color table
-- +---------------------------------------------+
-- " |  Color Name  |         RGB        |   Hex   |
-- " |--------------+--------------------+---------|
-- " | Black        | rgb(40, 44, 52)    | #282c34 |
-- " |--------------+--------------------+---------|
-- " | White        | rgb(171, 178, 191) | #abb2bf |
-- " |--------------+--------------------+---------|
-- " | Light Red    | rgb(224, 108, 117) | #e06c75 |
-- " |--------------+--------------------+---------|
-- " | Dark Red     | rgb(190, 80, 70)   | #be5046 |
-- " |--------------+--------------------+---------|
-- " | Green        | rgb(152, 195, 121) | #98c379 |
-- " |--------------+--------------------+---------|
-- " | Light Yellow | rgb(229, 192, 123) | #e5c07b |
-- " |--------------+--------------------+---------|
-- " | Dark Yellow  | rgb(209, 154, 102) | #d19a66 |
-- " |--------------+--------------------+---------|
-- " | Blue         | rgb(97, 175, 239)  | #61afef |
-- " |--------------+--------------------+---------|
-- " | Magenta      | rgb(198, 120, 221) | #c678dd |
-- " |--------------+--------------------+---------|
-- " | Cyan         | rgb(86, 182, 194)  | #56b6c2 |
-- " |--------------+--------------------+---------|
-- " | Gutter Grey  | rgb(76, 82, 99)    | #4b5263 |
-- " |--------------+--------------------+---------|
-- " | Comment Grey | rgb(92, 99, 112)   | #5c6370 |
-- " +---------------------------------------------+

if vim.g.colors_name == 'onedark' then
  vim.cmd[[highlight LspSagaCodeActionTitle guifg='#61afef' gui='bold']]
  vim.cmd[[highlight LspSagaCodeActionContent guifg='#56b6c2' gui='bold']]
  vim.cmd[[highlight LspSagaCodeActionBorder guifg='#4b5263']]
  vim.cmd[[highlight LspSagaCodeActionTrunCateLine guifg='#4b5263']]
  vim.cmd[[highlight JabsCurrent guifg='#61afef']]
  vim.cmd[[highlight JabsAlternate guifg='#abb2bf']]
end

