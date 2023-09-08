return {
  "ghillb/cybu.nvim",
  branch = "main",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim"
  },
  keys = function()
    local opts = { noremap = true, silent = true }
    return {
      {
        "<S-l>",
        "<Plug>(CybuNext)",
        opts
      },
      {
        "<S-h>",
        "<Plug>(CybuPrev)",
        opts
      }
    }
  end,
  config = function()
    require("cybu").setup({
      position = {
        relative_to = "win", -- win, editor, cursor
        anchor = "topright", -- topleft, topcenter, topright,
        -- centerleft, center, centerright,
        -- bottomleft, bottomcenter, bottomright
        -- vertical_offset = 10, -- vertical offset from anchor in lines
        -- horizontal_offset = 0, -- vertical offset from anchor in columns
        -- max_win_height = 5, -- height of cybu window in lines
        -- max_win_width = 0.5, -- integer for absolute in columns
        -- float for relative to win/editor width
      },
      display_time = 1000, -- time the cybu window is displayed
      style = {
        path = "relative", -- absolute, relative, tail (filename only)
        border = "rounded", -- single, double, rounded, none
        separator = " ", -- string used as separator
        prefix = "…", -- string used as prefix for truncated paths
        padding = 1, -- left & right padding in number of spaces
        hide_buffer_id = true,
        devicons = {
          enabled = true, -- enable or disable web dev icons
          colored = true, -- enable color for web dev icons
        },
      },
    })
  end,
}
