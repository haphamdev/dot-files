-- There is no big config in noice.nvim
-- Just want to get rid of this issue https://github.com/yioneko/vtsls/issues/159
-- This should be removed when the issue is fixed
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    routes = {
      {
        filter = {
          event = "notify",
          find = "Request textDocument/inlayHint failed",
        },
        opts = { skip = true },
      },
    },
  },
}
