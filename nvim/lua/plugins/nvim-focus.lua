return {
  "nvim-focus/focus.nvim",
  version = false,
  opts = {
    autoresize = { enable = false },
    ui = {
      signcolumn = false,
      relativenumber = true,
      absolutenumber_unfocussed = true,
    },
  },
  event = "BufEnter",
}
