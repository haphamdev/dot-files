return {
  { "mrjones2014/smart-splits.nvim" },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
  },
  { "rest-nvim/rest.nvim" },
  { "nvim-treesitter/playground" },
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
}
