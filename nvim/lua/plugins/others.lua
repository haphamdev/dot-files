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
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  { "VonHeikemen/fine-cmdline.nvim", dependencies = "MunifTanjim/nui.nvim" },
  { "xiyaowong/transparent.nvim" },
  {
    "stevearc/conform.nvim",
    enabled = false,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
  { "mrjones2014/smart-splits.nvim" },
}
