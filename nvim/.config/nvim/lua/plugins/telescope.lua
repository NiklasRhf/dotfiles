return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  keys = function()
    local opts = { noremap = true, silent = true }
    return {
      {
        '<leader>fb',
        [[<cmd>lua require('telescope.builtin').buffers({ previewer = false, layout_strategy = 'vertical', layout_config = { width = 0.4, height = 0.7 } })<CR>]],
        desc = "Find buffer",
        opts
      },
      {
        '<leader>ff',
        [[<cmd>lua require('telescope.builtin').find_files({ previewer = false, layout_strategy = 'vertical', layout_config = { width = 0.4, height = 0.7 } })<CR>]],
        desc = "Fuzzy find files in cwd",
        opts
      },
      {
        '<leader>fn',
        [[<cmd>lua require('telescope.builtin').find_files()<CR>]],
        desc = "Find files with preview",
        opts
      },
      {
        '<leader>fc',
        [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
        desc = "Find current buffer fuzzy",
        opts
      },
      {
        '<leader>fg',
        [[<cmd>lua require('telescope.builtin').git_commits()<CR>]],
        desc = "Find git commit",
        opts
      },
      {
        '<leader>fh',
        [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
        desc = "Find help tags",
        opts
      },
      {
        '<leader>ft',
        [[<cmd>lua require('telescope.builtin').tags()<CR>]],
        desc = "Find tags",
        opts
      },
      {
        '<leader>fw',
        [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
        desc = "Find string under cursor",
        opts
      },
      {
        '<leader>fs',
        [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
        desc = "Find string in cwd",
        opts
      },
      {
        '<leader>ft',
        [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
        desc = "Find tags current buffer",
        opts
      },
      {
        '<leader>fo',
        [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
        desc = "Fuzzy find in recent files",
        opts
      },
      {
        '<leader>fr',
        [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]],
        desc = "Find lsp references",
        opts
      },
      {
        '<leader>oo',
        [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]],
        desc = "Find colorscheme",
        opts
      },
    }
  end,
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
        file_ignore_patterns = { "obj", "bin", "public", "target", "node_modules", "icons" },
      },
    })
  end,
}
