return {
  'jeff-dh/expJABS.nvim',
  branch = 'expJABS',
  keys = function()
    local opts = { noremap = true, silent = true }
    return {
      {
        '<leader>b',
        [[<cmd>JABSOpen<CR>]],
        desc = "Show open buffers",
        opts
      }
    }
  end,
  config = function()
    require("jabs").setup({
      position = "center", -- center, corner
      width = 50,
      height = 10,
      border = "rounded", -- none, single, double, rounded, solid, shadow, (or an array or chars)
      -- Options for preview window
      preview_position = "top", -- top, bottom, left, right
      preview = {
        width = 70,
        height = 20,
        border = "rounded", -- none, single, double, rounded, solid, shadow, (or an array or chars)
      },
      highlight = {
        current = 'JabsCurrent',
        alternate = 'JabsAlternate',
      },
    })
  end
}
