return {
  { "mrjones2014/smart-splits.nvim" },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "nvim-focus/focus.nvim",
    version = false,
    opts = {
      autoresize = { enable = false },
      ui = { signcolumn = false },
    },
    event = "BufEnter",
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      on_highlights = function(hl, c)
        hl.WinSeparator = {
          fg = "#555555",
        }
      end,
    },
  },
}
