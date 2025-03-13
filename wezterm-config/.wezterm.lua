-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- config.color_scheme = "Nightfly (Gogh)"
config.color_scheme = "nightfox"

-- config.font = wezterm.font("MesloLGS Nerd Font Mono" )
config.font = wezterm.font("MesloLGS Nerd Font Mono" , { weight = "Bold" })
-- config.font = wezterm.font("MesloLGS Nerd Font Regular" , { weight = "Bold" })
config.font_size = 15
config.bold_brightens_ansi_colors = true

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- my coolnight colorscheme:
config.cursor_blink_rate = 800 -- Blink rate in milliseconds
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

-- Custom navigation logic to handle edges
local function navigate_pane_with_edge_handling(direction)
	return wezterm.action_callback(function(window, pane)
		-- Attempt to navigate in the given direction
		local success = window:perform_action(wezterm.action.ActivatePaneDirection(direction), pane)
		-- If navigation fails (e.g., at the edge), try an alternative direction
		-- if not success and (direction == "Left" or direction == "Right") then
		-- 	if direction == "Left" then
		-- 		-- If moving left fails, try moving up
		-- 		window:perform_action(wezterm.action.ActivatePaneDirection("Up"), pane)
		-- 	else
		-- 		-- If moving right fails, try moving down
		-- 		window:perform_action(wezterm.action.ActivatePaneDirection("Down"), pane)
		-- 	end
		-- end
		if not success and direction == "Left" then
			success = window:perform_action(wezterm.action.ActivatePaneDirection("Up"), pane)
			if not success then
				window:perform_action(wezterm.action.ActivatePaneDirection("Down"), pane)
			end
		elseif not success and direction == "Right" then
			success = window:perform_action(wezterm.action.ActivatePaneDirection("Up"), pane)
			if not success then
				window:perform_action(wezterm.action.ActivatePaneDirection("Down"), pane)
			end
		end
	end)
end

-- Config inverted horizontal mouse scrolling
local act = wezterm.action

config.mouse_bindings = {
  -- Invert horizontal scrolling
  {
    event = { Down = { streak = 1, button = { WheelLeft = 1 } } },
    mods = 'NONE',
    action = act.ScrollByLine(3), -- Scroll right by 3 lines when scrolling left
  },
  {
    event = { Down = { streak = 1, button = { WheelRight = 1 } } },
    mods = 'NONE',
    action = act.ScrollByLine(-3), -- Scroll left by 3 lines when scrolling right
  },
}

config.send_composed_key_when_right_alt_is_pressed = false

-- Custom keybindings for pane navigation
config.keys = {
	{ key = "h", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },
	-- { key = "[", mods = "CMD", action = navigate_pane_with_edge_handling("Left") },
	-- { key = "]", mods = "CMD", action = navigate_pane_with_edge_handling("Right") },
	{ key = "k", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({}) },
	{ key = "d", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({}) },
	{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
}

-- and finally, return the configuration to wezterm
return config

