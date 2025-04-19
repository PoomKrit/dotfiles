-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Including Add-ons
local session_manager = require("wezterm-session-manager/session-manager")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

-- Set zoxide path
workspace_switcher.zoxide_path = "/opt/homebrew/bin/zoxide"

-- Appearance
config.color_scheme = "nightfox"
config.font = wezterm.font("MesloLGS Nerd Font Mono", { weight = "Bold" })
config.font_size = 15
config.bold_brightens_ansi_colors = true

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.cursor_blink_rate = 800
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.colors = {
  foreground = "#CBE0F0",
  background = "#011423",
  cursor_bg = "#FFFFFF",
  cursor_border = "#FFFFFF",
  cursor_fg = "#011423",
  selection_bg = "#033259",
  selection_fg = "#CBE0F0",
  ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
  brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

-- Tab manager
config.switch_to_last_active_tab_when_closing_tab = true

-- Session manager config
wezterm.on("save_session", function(window) session_manager.save_state(window) end)
wezterm.on("load_session", function(window) session_manager.load_state(window) end)
wezterm.on("restore_session", function(window) session_manager.restore_state(window) end)
-- wezterm.on("window-destroyed", function(window) session_manager.save_state(window) end)
-- set up workspace to be loaded on startup of wezterm
wezterm.on("gui-startup", function(cmd)
  local dotfiles_path = wezterm.home_dir .. "~/dotfiles"
  local tab, build_pane, window = mux.spawn_window({
    workspace = "dotfiles",
    cwd = dotfiles_path,
    args = args,
  })
  build_pane:send_text("nvim\n")
  mux.set_active_workspace("dotfiles")
end)
-- Show active workspace in right status bar
wezterm.on("update-right-status", function(window, pane)
  window:set_right_status(window:active_workspace())
end)

-- Custom navigation logic to handle edges
local function navigate_pane_with_edge_handling(direction)
  return wezterm.action_callback(function(window, pane)
    local success = window:perform_action(act.ActivatePaneDirection(direction), pane)
    if not success and direction == "Left" then
      success = window:perform_action(act.ActivatePaneDirection("Up"), pane)
      if not success then
        window:perform_action(act.ActivatePaneDirection("Down"), pane)
      end
    elseif not success and direction == "Right" then
      success = window:perform_action(act.ActivatePaneDirection("Up"), pane)
      if not success then
        window:perform_action(act.ActivatePaneDirection("Down"), pane)
      end
    end
  end)
end

-- Mouse config
config.alternate_buffer_wheel_scroll_speed = 1
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = { WheelLeft = 1 } } },
    mods = 'NONE',
    action = act.ScrollByLine(3),
  },
  {
    event = { Down = { streak = 1, button = { WheelRight = 1 } } },
    mods = 'NONE',
    action = act.ScrollByLine(-3),
  },
}

config.send_composed_key_when_right_alt_is_pressed = false

-- Keybindings
local keys = {
  { key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") },
  { key = "k", mods = "CMD", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "CMD", action = act.ActivatePaneDirection("Down") },
  { key = "d", mods = "CMD", action = act.SplitHorizontal({}) },
  { key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({}) },
  { key = "]", mods = "CMD", action = act.ActivateTabRelative(1) },
  { key = "[", mods = "CMD", action = act.ActivateTabRelative(-1) },
  { key = "s", mods = "CMD|SHIFT", action = act.EmitEvent("save_session") },
  { key = "l", mods = "CMD|SHIFT", action = act.EmitEvent("load_session") },
  { key = "r", mods = "CMD|SHIFT", action = act.EmitEvent("restore_session") },
  -- { key = "n", mods = "CMD|SHIFT", action = act.SwitchToWorkspace },
  { key = "p", mods = "CMD|SHIFT", action = act.SwitchWorkspaceRelative(-1) },
  -- Workspace switcher plugin keys
  { key = "w", mods = "CMD|SHIFT", action = workspace_switcher.switch_workspace() },
  { key = ".", mods = "CMD|SHIFT", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
  { key = "[", mods = "CMD|SHIFT", action = act.SwitchWorkspaceRelative(1) },
  { key = "]", mods = "CMD|SHIFT", action = act.SwitchWorkspaceRelative(-1) },
  {
    key = 'Enter',
    mods = 'CMD|SHIFT',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'b',
    mods = 'CTRL',
    action = act.RotatePanes 'CounterClockwise',
  },
}

config.keys = keys

-- and finally, return the configuration to wezterm
return config
