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
			opts = {
				render = "wrapped-compact", -- Choose between "default", "minimal", "simple", or "compact"
				timeout = 5000, -- Adjust timeout duration (5000ms = 5 seconds)
				sticky = true, -- Keeps notifications visible until dismissed
			},
			config = function()
				-- Set up a keymap to manually dismiss notifications
				vim.keymap.set("n", "<leader>cn", function()
					require("notify").dismiss({ silent = true, pending = true })
				end, { desc = "Close Notifications" })
			end,
		},
	},
}
