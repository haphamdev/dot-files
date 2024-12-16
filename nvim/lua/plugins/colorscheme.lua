return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "bluz71/vim-nightfly-colors" },

  {
    "folke/tokyonight.nvim",
    disabled = true,
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
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
