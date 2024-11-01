local wezterm = require("wezterm")

local config = {}
-- User config builder if possible


if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.automatically_reload_config = false
config.color_scheme = "Tokyo Night"

config.font = wezterm.font_with_fallback({
	{ family = "DejaVuSansM Nerd Font", scale = 1.1 },
	{ family = "JetBrains Mono", scale = 1.1 },
})

config.window_background_opacity = 0.95
config.macos_window_background_blur = 5
config.window_decorations = "RESIZE"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.scrollback_lines = 5000
config.default_workspace = "home"
config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
config.status_update_interval = 2000

config.inactive_pane_hsb = {
	saturation = 0.7,
	brightness = 0.3,
}


require("status-bar").apply_to_config(config)
require('tab-format').apply_to_config(config)
require("keymappings").apply_to_config(config)
require("plugins").apply_to_config(config)


return config
