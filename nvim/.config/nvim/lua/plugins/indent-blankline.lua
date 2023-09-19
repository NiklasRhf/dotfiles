return {
  "lukas-reineke/indent-blankline.nvim",
  opts = {
    show_end_of_line = false,
    buftype_exclude = { "terminal" }
  },
  config = function()
    vim.opt.list = true
  end
}
