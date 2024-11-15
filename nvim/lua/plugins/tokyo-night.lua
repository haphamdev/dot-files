return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_highlights = function(hl, _)
      hl.WinSeparator = {
        fg = "#555555",
      }
    end,
  },
}
