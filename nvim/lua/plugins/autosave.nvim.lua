return {
  "okuuva/auto-save.nvim",
  version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  config = function() -- Somehow, LazyNvim does not invoke setup for this plugin. I need this 'config' to run setup
    require("auto-save").setup({
      debounce_delay = 4000,
    })
  end,
}
