local wezterm = require("wezterm")
local utils = require("utils")
local act = wezterm.action
local module = {}

function module.apply_to_config(config)
	config.leader = { key = "f", mods = "CTRL", timeout_milliseconds = 3000 }

	config.keys = {
		{ key = "f", mods = "LEADER", action = act.SendKey({ key = "f", mods = "CTRL" }) },
		{ key = "f", mods = "LEADER|CTRL", action = act.SendKey({ key = "f", mods = "CTRL" }) },
		{
			key = "h",
			mods = "LEADER",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "v",
			mods = "LEADER",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		-- Reload Wezterm config
		{ key = "r", mods = "LEADER", action = act.ReloadConfiguration },

		-- Showing Debug overlay
		{ key = "D", mods = "LEADER", action = act.ShowDebugOverlay },

		-- Switch panes
		{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },

		-- Resize panes
		{ key = "h", mods = "OPT", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", mods = "OPT", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", mods = "OPT", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", mods = "OPT", action = act.AdjustPaneSize({ "Right", 1 }) },

		-- Activate command palette
		{ key = ":", mods = "LEADER", action = act.ActivateCommandPalette },

		-- Zoom in a pane
		{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

		-- Rotate panes
		{ key = "]", mods = "LEADER", action = act.RotatePanes("Clockwise") },

		-- Manipulating tabs
		{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

		--Activate other key tables
		{
			key = "2",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "repeated",
				one_shot = false,
			}),
		},
		{
			key = "3",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "one_hit",
				one_shot = true,
			}),
		},

		-- Switching tabs
		{
			key = "t",
			mods = "LEADER",
			action = wezterm.action_callback(function(win, pane)
				local tabInfo = utils.map(win:mux_window():tabs_with_info(), function(index, tab)
					local title = tab.tab:get_title()
					title = not title or #title == 0 and tostring(index) or title
					return { label = title, id = tostring(index - 1) }
				end)

				win:perform_action(
					act.InputSelector({
						action = wezterm.action_callback(function(w, p, id, label)
							if label then
								w:perform_action(act.ActivateTab(tonumber(id)), p)
							end
						end),
						choices = tabInfo,
						fuzzy_description = "Choose a tab:",
						fuzzy = true,
					}),
					pane
				)
			end),
		},

		-- Switching workspaces
		{
			key = "w",
			mods = "LEADER",
			action = wezterm.action_callback(function(window, pane)
				local workspaces = wezterm.mux.get_workspace_names()

				-- Add an option to create new workspace
				table.insert(workspaces, "!!new-workspace")

				local choices = utils.map(workspaces, function(id, w)
					return { label = w }
				end)

				window:perform_action(
					act.InputSelector({
						choices = choices,
						fuzzy_description = "Choose a workspace:",
						fuzzy = true,
						action = wezterm.action_callback(function(w, p, _, label)
							if not label then
								return
							end
							if label == "!!new-workspace" then
								-- Ask for new workspace name and spawn it
								w:perform_action(
									act.PromptInputLine({
										description = "Enter workspace name:",
										action = wezterm.action_callback(function(w, p, line)
											if line then
												w:perform_action(act.SwitchToWorkspace({ name = line }), p)
											end
										end),
									}),
									p
								)
							else
								w:perform_action(act.SwitchToWorkspace({ name = label }), p)
							end
						end),
					}),
					pane
				)
			end),
		},

		-- Copy mode
		{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },

		-- Open dot-file tab
		{
			key = ".",
			mods = "LEADER",
			action = wezterm.action_callback(function(win, pane)
				for index, tab_info in pairs(win:mux_window():tabs_with_info()) do
					if tab_info.tab:get_title() == "dot-files" then
						win:perform_action(act.ActivateTab(tonumber(index) - 1), pane)
					else
						wezterm.log_error("⚠️No dot-files tab available")
					end
				end
			end),
		},
	}

	config.key_tables = {
		repeated = {
			{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
			{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
			{ key = "Escape", action = act.PopKeyTable },
		},
		one_hit = {
			{
				key = "r",
				action = act.PromptInputLine({
					description = "Enter the tab title:",
					action = wezterm.action_callback(function(window, _, line)
						if line then
							window:active_tab():set_title(line)
						end
					end),
				}),
			},
		},
	}
end

return module
