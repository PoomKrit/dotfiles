return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		{
			"rcarriga/nvim-notify",
			-- opts = {
			-- 	render = "wrapped-compact", -- Choose between "default", "minimal", "simple", or "compact"
			-- 	timeout = 5000, -- Adjust timeout duration (5000ms = 5 seconds)
			-- 	sticky = true, -- Keeps notifications visible until dismissed
			-- },
			config = function()
				local notify = require("notify")
				notify.setup({
					render = "wrapped-compact", -- Ensure render is applied here as well
					timeout = 5000,
					sticky = true,
					level = "info", -- Log level: "trace", "debug", "info", "warn", "error"
					max_width = 80, -- Maximum width of the notification window (nil means unlimited)
					max_height = 10, -- Maximum height of the notification window (nil means unlimited)
					stages = "fade", -- Notification stages: "fade", "slide", "fade_in_slide_out", etc.
					background_colour = "#000000", -- Background color of notifications
					icons = {
						ERROR = "",
						WARN = "",
						INFO = "",
						DEBUG = "",
						TRACE = "✎",
					}, -- Icons for different notification levels
					time_formats = {
						"%H:%M:%S", -- Default time format for notifications
					}, -- Required time format
					on_open = function() end, -- Optional callback for notification opening
					on_close = function() end, -- Optional callback for notification closing
					minimum_width = 20, -- Set minimum width to avoid layout issues
					fps = 30, -- Frames per second for animations
					top_down = true, -- Display notifications from top to bottom
				})
				-- Set up a keymap to manually dismiss notifications
				vim.keymap.set("n", "<leader>cn", function()
					require("notify").dismiss({ silent = true, pending = true })
				end, { desc = "Close Notifications" })
			end,
		},
	},
}
