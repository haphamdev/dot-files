local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
  wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim.git").apply_to_config(config)
end

return module


