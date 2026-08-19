return {
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
  },
  { "zdcthomas/yop.nvim" },
  {
    "haphamdev/copier.nvim",
    dependencies = {
      "zdcthomas/yop.nvim",
    },
    config = function()
      require("copier").setup()
    end,
  },
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },
}
