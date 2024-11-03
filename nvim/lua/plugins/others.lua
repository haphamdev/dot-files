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
      on_highlights = function(hl, _)
        hl.WinSeparator = {
          fg = "#555555",
        }
      end,
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
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree toggle float reveal<cr>",
        desc = "Reveal current file in Neotree float window",
      },
    },
  },
  {
    "okuuva/auto-save.nvim",
    version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    config = function() -- Somehow, LazyNvim does not invoke setup for this plugin. I need this 'config' to run setup
      require("auto-save").setup()
    end,
  },
}
