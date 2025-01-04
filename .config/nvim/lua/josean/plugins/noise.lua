return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- Add any Noice options here
	},
	dependencies = {
		-- Required dependency
		"MunifTanjim/nui.nvim",

		-- Optional dependency: `nvim-notify` for notifications
		{
			"rcarriga/nvim-notify",
			config = function()
				local notify = require("notify")
				notify.setup({
					-- Render style for notifications
					render = "simple", -- Options: "default", "minimal", "simple", "compact" and wrapped-compact

					-- Notification behavior
					timeout = 5000, -- Duration in milliseconds (e.g., 5000ms = 5 seconds)
					sticky = true, -- Notifications stay visible until dismissed

					-- Notification level
					level = "info", -- Options: "trace", "debug", "info", "warn", "error"

					-- Notification window dimensions
					max_width = 80, -- Maximum width of notification window
					max_height = 10, -- Maximum height of notification window

					-- Notification animations
					stages = "fade", -- Options: "fade", "slide", "fade_in_slide_out", etc.

					-- Visual settings
					background_colour = "#000000", -- Background color for notifications
					icons = { -- Icons for different levels
						ERROR = "",
						WARN = "",
						INFO = "",
						DEBUG = "",
						TRACE = "✎",
					},

					-- Additional options
					time_formats = {
						"%H:%M:%S", -- Display time format
					},
					on_open = function() end, -- Callback for notification opening
					on_close = function() end, -- Callback for notification closing
					minimum_width = 20, -- Prevent layout issues with narrow windows
					fps = 30, -- Animation frames per second
					top_down = true, -- Notifications flow from top to bottom

					-- **Critical: Add this field**
					merge_duplicates = true, -- Avoid duplicate notifications
				})

				-- Keybinding to dismiss notifications
				vim.keymap.set("n", "<leader>nc", function()
					require("notify").dismiss({ silent = true, pending = true })
				end, { desc = "Close Notifications" })
			end,
		},
	},
}
