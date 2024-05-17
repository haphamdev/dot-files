return {
  { "christoomey/vim-system-copy", event = "BufEnter" },
  { "axieax/urlview.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  { "Pocco81/auto-save.nvim" },
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
}
