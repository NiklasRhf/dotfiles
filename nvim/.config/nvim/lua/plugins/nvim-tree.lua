return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = function()
    local opts = { noremap = true, silent = true }
    return {
      {
        "<Leader>ee",
        "<cmd>NvimTreeToggle<CR>",
        desc = "Toggle file explorer",
        opts
      },
      {
        "<leader>ef",
        "<cmd>NvimTreeFindFileToggle<CR>",
        desc = "Toggle file explorer on current file",
        opts
      },
      {
        "<leader>ec",
        "<cmd>NvimTreeCollapse<CR>",
        desc = "Collapse file explorer",
        opts
      },
      {
        "<leader>er",
        "cmd>NvimTreeRefresh<CR>",
        desc = "Refresh file explorer",
        opts
      },
    }
  end,
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#2c596c ]])

    nvimtree.setup({
      view                = {
        width = 40,
        side = 'right',
        relativenumber = true,
      },
      renderer            = {
        indent_markers = {
          enable = true
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      diagnostics         = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        }
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions             = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters             = {
        custom = { ".DS_Store" },
        dotfiles = false,
        --custom = { "\\.git", "node_modules" },
        exclude = {}
      },
      git                 = {
        ignore = false,
      },
      system_open         = {
        cmd  = nil,
        args = {}
      },
      hijack_directories  = {
        enable = true,
        auto_open = true,
      },
      update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
      },
      disable_netrw       = true,
      hijack_netrw        = true,
      update_cwd          = false,
    })
  end,
}
