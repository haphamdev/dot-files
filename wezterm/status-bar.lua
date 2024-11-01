local wezterm = require("wezterm")
local colors = require("colors")
local utils = require("utils")
local module = {}

module.apply_to_config = function(config)
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

  local function getBatteryInfo()
    local batteryInfo = ""

    for _, b in ipairs(wezterm.battery_info()) do
      batteryInfo = batteryInfo
          .. string.format(" %.0f%%", b.state_of_charge * 100)
          .. " "
          .. wezterm.nerdfonts.md_lightning_bolt
    end

    local batterInfoFormat = utils.formatSegment({
      text = wezterm.pad_left(batteryInfo, 6),
      bg = colors.secondaryBackground,
      fg = colors.secondary,
    })

    return batterInfoFormat
  end

  local function getHostname(pane)
    local cwd = pane:get_current_working_dir()
    local hostname = ""
    if cwd then
      hostname = cwd.host or wezterm.hostname()
    end
    return utils.formatSegment({
      text = wezterm.pad_right(wezterm.nerdfonts.dev_apple .. " " .. hostname, 6),
      bg = colors.alternativeBackground,
      fg = colors.alternative,
      left = colors.alternativeBackground,
    })
  end

  local function getCwd(pane)
    local cwd = pane:get_current_working_dir()
    local is_project = false
    if cwd and cwd.file_path then
      cwd = cwd.file_path
      local project_prefix = "/Users/hapham/projects/"
      is_project = cwd:sub(1, #project_prefix) == project_prefix
      if is_project then
        cwd = cwd:gsub(project_prefix, "") .. " " .. wezterm.nerdfonts.cod_code .. " "
      else
        cwd = string.gsub(cwd, "/Users/hapham", "~")
            .. " "
            .. wezterm.nerdfonts.oct_file_directory_open_fill
            .. " "
      end
    else
      cwd = "???" .. " " .. wezterm.nerdfonts.oct_file_directory_open_fill .. " "
    end

    return utils.formatSegment({
      text = cwd,
    })
  end

  local function getGitDiffStats(cwd)
    local success, gitStat, stderr = wezterm.run_child_process({ "git", "-C", cwd, "diff", "--shortstat" })

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
      local cmd = { "git", "--git-dir", cwd.file_path .. "/.git", "branch", "--show-current" }
      local success, branch, stderr = wezterm.run_child_process(cmd)
      branch = string.gsub(branch, "\n", "")

      if success then
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

  wezterm.on("update-status", function(window, pane)
    local result = {}
    utils.mergeTable(result, getGitInfo(pane))
    utils.mergeTable(result, getCwd(pane))
    utils.mergeTable(result, getBatteryInfo())
    utils.mergeTable(result, getKeyLayerStatus(window))

    window:set_right_status(wezterm.format(result))
    window:set_left_status(wezterm.format(getHostname(pane)))
  end)
end

return module
