local wezterm = require("wezterm")
local colors = require("colors")
local module = {}

function module.map(t, func)
	local result = {}
	for key, value in pairs(t) do
		local v = func(key, value)
		table.insert(result, v)
	end
	return result
end

function module.inspect(value)
	wezterm.log_info("Inspect: " .. wezterm.to_string(value))
end

function module.mergeTable(result, toBeMerged)
	for _, v in pairs(toBeMerged) do
		table.insert(result, v)
	end
end

function module.formatSegment(input)
	return {
		"ResetAttributes",
		{ Background = { Color = input.left or colors.statusBarBackground } },
		{ Foreground = { Color = input.bg or colors.secondaryBackground } },
		{ Text = wezterm.nerdfonts.ple_lower_right_triangle },
		{ Foreground = { Color = input.fg or colors.secondary } },
		{ Background = { Color = input.bg or colors.secondaryBackground } },
		{ Text = input.text },
		{ Background = { Color = input.right or colors.statusBarBackground } },
		{ Foreground = { Color = input.bg or colors.secondaryBackground } },
		{ Text = wezterm.nerdfonts.ple_upper_left_triangle },
	}
end
return module
