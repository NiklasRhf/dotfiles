return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    local wk = require("which-key")
    wk.register({
      f = {
        name = "Find",
        f = { "Find file" },
        n = { "Find file without preview" },
        b = { "Find buffer" },
        c = { "Find string in current buffer" },
        h = { "Find help tags" },
        w = { "Find string under cursor in files" },
        s = { "Find string in files" },
        t = { "Find tags in current buffer" },
        o = { "Find old files" },
        d = { "Find symbols in document" },
        p = { "Find projects" },
      },
      g = {
        name = "Git",
        c = { "Commits" },
        b = { "Buffer Commits" },
        n = { "Next hunk" },
        p = { "Prevous hunk" },
        h = { "Preview hunk" },
        d = { "Diff" },
      },
      e = {
        name = "Explorer",
      },
      D = {
        name = "Type definition",
      },
      q = {
        name = "Location list",
      },
      c = {
        name = "Code",
        a = { "Code action" },
        d = { "Code diagnostics" },
        p = { "Previous diagnostic" },
        n = { "Next diagnostic" },
        r = { "Rename" },
      },
      h = {
        name = "Gitsigns",
      },
      l = {
        name = "LSP",
        f = { "Format code" },
        n = { "Goto next diagnostic" },
        p = { "Goto previous diagnostic" },
        q = { "Show diagnostic list" },
        r = { "Show references" },
        K = { "Show docs" },
        s = { "Show signature" },
        c = { "Show colors" },
      },
      o = {
        name = "Colorschemes",
        o = { "Show colorschemes" }
      },
      t = {
        name = "Trouble",
        t = "Toggle",
        d = "Document diagnostics",
        q = "Quickfix",
        l = "LocList",
      },
      d = {
        name = "Debugging",
        u = "Open UI",
        b = "Toggle Breakpoint",
        B = "Set Breakpoint (Breakpoint Condition)",
        l = "Set Breakpoint (Log point message)",
        r = "Open Repl",
        L = "Run last",
        c = "Continue",
        o = "Step over",
        i = "Step into",
        t = "Step out",
      },
      b = {
        name = "Buffers",
      },
      r = {
        name = "Rust Tools",
        e = "Enable inlay hints",
        d = "Disable inlay hints",
        p = "Parent module",
        h = "Hover actions",
      },
      a = {
        name = "ChatGPT",
        c = "Open prompt",
        e = "Edit with instructions",
        p = "Act as",
        k = "Keymaps",
        a = {
          name = "Run action",
          c = "Complete code",
        }
      }
    }, { prefix = "<leader>", mode = "n", buffer = nil, silent = true, nowait = true })
  end,
  opts = {
  },
}
