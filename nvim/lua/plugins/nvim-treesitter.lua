return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "prisma" },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader><cr>",
        node_incremental = "<leader><cr>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}
