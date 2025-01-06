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
        hl.LineNr = { fg = "#3b4261" }
        hl.LineNrAbove = { fg = "#5D6899" }
        hl.LineNrBelow = { fg = "#5D6899" }
        hl.WinSeparator = { fg = "#5D6899" }
        hl.LspInlayHint = {
          -- bg = "#24283c",
          fg = "#7882B3",
          italic = true,
        }
        hl.DiagnosticUnnecessary = {
          -- fg = "#626BA6",
          undercurl = true,
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
