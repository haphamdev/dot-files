local w = require("wezterm")
local utils = require("utils")

local all_windows = w.mux.all_windows()

w.log_info("All windows are:")

for index, window in pairs(all_windows) do
	w.log_info("Window ", index)
	utils.inspect(window)
	w.log_info(window:get_title())
	w.log_info("GUI window is: ", window:gui_window())
end
