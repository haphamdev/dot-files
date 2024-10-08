return {
  { "christoomey/vim-system-copy", event = "BufEnter" },
  { "axieax/urlview.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  { "m4xshen/autoclose.nvim" },
  { "zdcthomas/yop.nvim" },
  { "mrjones2014/smart-splits.nvim", opt = {} },
  { "rest-nvim/rest.nvim" },
}
