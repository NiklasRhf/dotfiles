return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = function()
    local opts = { noremap = true, silent = true }
    return {
      {
        "<leader>hm",
        "<cmd>lua require('harpoon.mark').add_file()<cr>",
        desc = "Mark file with harpoon",
        opts
      },
      {
        "<leader>hn",
        "<cmd>lua require('harpoon.ui').nav_next()<cr>",
        desc = "Go to next harpoon mark",
        opts
      },
      {
        "<leader>hp",
        "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
        desc = "Go to previous harpoon mark",
        opts
      },
      {
        "<leader>hh",
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
        desc = "Show harpoon quick menu",
        opts
      },
      {
        "<leader>hj",
        "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
        desc = "Navigate to first harpoon",
        opts,
      }
    }
  end,
}
