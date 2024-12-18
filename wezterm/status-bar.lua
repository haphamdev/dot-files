local wezterm = require("wezterm")
local colors = require("colors")
local utils = require("utils")
local module = {}

function module.apply_to_config(config)
	config.window_frame = {
		font = require("wezterm").font({ family = "DejaVuSansM Nerd Font" }),
		font_size = 14,
		active_titlebar_bg = colors.statusBarBackground,
	}

	local function getKeyLayerStatus(window)
		local status = ""
		if window:leader_is_active() then
			status = "Leader " .. wezterm.nerdfonts.md_alpha_l_circle .. " "
		elseif window:active_key_table() then
			status = window:active_key_table() .. " " .. wezterm.nerdfonts.md_alpha_l_circle .. " "
		end

		if #status > 0 then
			return utils.formatSegment({
				text = wezterm.pad_left(status, 10),
				bg = colors.primaryBackground,
				fg = colors.primary,
				right = colors.primaryBackground,
			})
		end

		status = "______ " .. wezterm.nerdfonts.md_alpha_l_circle_outline .. " "
		return utils.formatSegment({
			text = wezterm.pad_left(status, 10),
			bg = colors.alternative,
			fg = colors.primaryBackground,
			right = colors.alternative,
		})
	end

	local function getCwd(pane)
		local cwd = pane:get_current_working_dir()
		local is_project = false
		if cwd and cwd.file_path then
			cwd = cwd.file_path
			local homeDir = wezterm.home_dir
			local project_prefix = homeDir .. "/projects/"
			is_project = cwd:sub(1, #project_prefix) == project_prefix
			if is_project then
				cwd = cwd:gsub(project_prefix, "") .. " " .. wezterm.nerdfonts.cod_code .. " "
			else
				cwd = string.gsub(cwd, homeDir, "~") .. " " .. wezterm.nerdfonts.oct_file_directory_open_fill .. " "
			end
		else
			cwd = "???" .. " " .. wezterm.nerdfonts.oct_file_directory_open_fill .. " "
		end

		return utils.formatSegment({
			text = cwd,
		})
	end

	local function getGitDiffStats(cwd)
		local success, gitStat, _ = wezterm.run_child_process({ "git", "-C", cwd, "diff", "--shortstat" })

		if success then
			local _, _, changeCountString = string.find(gitStat, "(%d+) files? changed")
			local _, _, insertionCountString = string.find(gitStat, "(%d+) insertions?")
			local _, _, deletionCountString = string.find(gitStat, "(%d+) deletions?")

			return true, changeCountString, insertionCountString, deletionCountString
		else
			return false, 0, 0, 0
		end
	end

	local function getGitInfo(pane)
		local max_length = 30
		local cwd = pane:get_current_working_dir()
		if cwd and cwd.file_path then
			local gitDir = require("get-git-dir").getGitDir(cwd.file_path) .. "/.git"
			local cmd = { "git", "--git-dir", gitDir, "branch", "--show-current" }
			local success, branch, error = wezterm.run_child_process(cmd)

			if success then
				branch = string.gsub(branch, "\n", "")
				if #branch > max_length then
					branch = wezterm.truncate_right(branch, max_length - 3) .. "..."
				end

				local getStatSuccess, changes, insertions, deletions = getGitDiffStats(cwd.file_path)
				local statLine = ""
				if getStatSuccess then
					if changes then
						statLine = statLine .. wezterm.nerdfonts.fa_exclamation_circle .. " " .. changes .. "  "
					end
					if insertions then
						statLine = statLine .. wezterm.nerdfonts.fa_plus_circle .. " " .. insertions .. "  "
					end
					if deletions then
						statLine = statLine .. wezterm.nerdfonts.fa_minus_circle .. " " .. deletions .. "  "
					end
				end

				return utils.formatSegment({
					text = statLine .. branch .. " " .. wezterm.nerdfonts.oct_git_branch,
					bg = colors.secondaryBackground,
					fg = colors.secondary,
				})
			end
		end
		return utils.formatSegment({
			text = " " .. wezterm.nerdfonts.md_cancel .. " " .. wezterm.nerdfonts.cod_git_commit .. " ",
			bg = colors.secondaryBackground,
			fg = colors.secondary,
		})
	end

	local function getActiveWorkspace()
		local workspaceName = " "
			-- .. wezterm.nerdfonts.cod_workspace_trusted
			.. wezterm.nerdfonts.cod_verified_filled
			.. " "
			.. wezterm.mux.get_active_workspace():upper()
			.. " "

		return utils.formatSegment({
			left = colors.secondaryBackground,
			text = workspaceName,
		})
	end

	wezterm.on("update-status", function(window, pane)
		local rightStatusFormatItem = {}
		utils.mergeTable(rightStatusFormatItem, getGitInfo(pane))
		utils.mergeTable(rightStatusFormatItem, getCwd(pane))
		utils.mergeTable(rightStatusFormatItem, getKeyLayerStatus(window))

		local leftStatusFormatItem = {}
		-- utils.mergeTable(leftStatusFormatItem, getHostname(pane))
		utils.mergeTable(leftStatusFormatItem, getActiveWorkspace())

		window:set_right_status(wezterm.format(rightStatusFormatItem))
		window:set_left_status(wezterm.format(leftStatusFormatItem))
	end)
end

return module
