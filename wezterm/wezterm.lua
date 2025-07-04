local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

local config = {}
-- User config builder if possible

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.automatically_reload_config = false
config.color_scheme = "Decaf (base16)"

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

--- @class WeztermWorkspace
--- @field cwd string
--- @field tabs WeztermTab[]
---
--- @class WeztermTab
--- @field name string
--- @field cwd string

---@type table<string, WeztermWorkspace>
local workspaces = {
	home = {
		cwd = "/Users/hapham",
		tabs = {
			{ name = "dot", cwd = "/Users/hapham/projects/personal/dot-files/" },
			{ name = "notes", cwd = "/Users/hapham/notes" },
		},
	},
	["repeat"] = {
		cwd = "/Users/hapham/projects/repeat",
		tabs = {
			{ name = "database", cwd = "/Users/hapham/projects/repeat" },
			{ name = "payment", cwd = "/Users/hapham/projects/repeat/repeat-payment" },
			{ name = "shopping-cart", cwd = "/Users/hapham/projects/repeat/repeat-shopping-cart" },
			{ name = "orders", cwd = "/Users/hapham/projects/repeat/repeat-orders" },
			{ name = "symfony", cwd = "/Users/hapham/projects/repeat/xygaming_symfony" },
			{ name = "rewards", cwd = "/Users/hapham/projects/repeat/repeat-rewards" },
			{ name = "kafka-msg", cwd = "/Users/hapham/projects/repeat/kafka-message-types" },
			{ name = "mobile-app", cwd = "/Users/hapham/projects/repeat/repeat-mobile-app" },
		},
	},
}

wezterm.on("gui-startup", function(w, p)
	for workspace_name, workspace in pairs(workspaces) do
		local _, initialPane, window = mux.spawn_window({ cwd = workspace.cwd, workspace = workspace_name })

		for _, t in pairs(workspace.tabs) do
			window:spawn_tab({ cwd = t.cwd }):set_title(t.name)
		end

		-- Remove the initial tab created when creating the window
		-- because this initial tab is not in the defined tabs of the workspace
		-- As there is no direct way to close the initialTab, we can close the pane in that tab
		if #workspace.tabs > 1 then
			initialPane:send_text("exit\n")
		end
	end

	mux.set_active_workspace("home")
end)

require("status-bar").apply_to_config(config)
require("tab-format").apply_to_config(config)
require("keymappings").apply_to_config(config)
require("plugins").apply_to_config(config)

return config
