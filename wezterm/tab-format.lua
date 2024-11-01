local wezterm = require("wezterm")
local utils = require("utils")
local colors = require("colors")
local module = {}

local function getTabTitle(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

module.apply_to_config = function(config)
  wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local activeTabBackground = colors.primaryBackground
    local inactiveTabBackground = colors.secondaryBackground

    local edgeForeground = "#CCCCCC"
    local activeTabForeground = colors.primary
    local inactiveTabForeground = colors.disabled

    local tabBackground = inactiveTabBackground
    local tabForeground = inactiveTabForeground
    local intensity = "Normal"
    local italic = true

    if tab.is_active then
      tabBackground = activeTabBackground
      tabForeground = activeTabForeground
      intensity = "Bold"
      italic = true
    end

    local title = getTabTitle(tab)

    local edgeLeft = wezterm.nerdfonts.ple_lower_right_triangle
    local edgeRight = wezterm.nerdfonts.ple_upper_left_triangle

    return {
      { Background = { Color = colors.statusBarBackground } },
      { Foreground = { Color = edgeForeground } },
      { Text = edgeLeft },
      { Background = { Color = tabBackground } },
      { Foreground = { Color = edgeForeground } },
      { Text = edgeRight },
      { Background = { Color = tabBackground } },
      { Foreground = { Color = tabForeground } },
      { Attribute = { Intensity = intensity } },
      { Attribute = { Italic = italic } },
      { Text = title },
      { Background = { Color = colors.statusBarBackground } },
      { Foreground = { Color = tabBackground } },
      { Text = edgeRight },
    }
  end)
end

return module
