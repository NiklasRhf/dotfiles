return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        autotag = { enable = true },
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "rust",
          "tsx",
          "yaml",
          "html",
          "xml",
          "css",
          "markdown",
          "markdown_inline",
          "svelte",
          "graphql",
          "python",
          "vim",
          "bash",
          "lua",
          "dockerfile",
          "gitignore",
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        auto_install = true,
      })
    end,
  },
}
