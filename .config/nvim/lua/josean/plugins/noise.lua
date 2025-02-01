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
          render = "simple", -- Render style for notifications
          timeout = 5000, -- Duration in milliseconds (e.g., 5000ms = 5 seconds)
          sticky = true, -- Notifications stay visible until dismissed
          level = "info", -- Options: "trace", "debug", "info", "warn", "error"
          max_width = 80, -- Maximum width of notification window
          max_height = 10, -- Maximum height of notification window
          stages = "fade", -- Options: "fade", "slide", "fade_in_slide_out", etc.
          background_colour = "#000000", -- Background color for notifications
          -- Icons for different levels
          icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
          },
          merge_duplicates = true, -- Avoid duplicate notifications
        })

        -- Keybinding to dismiss notifications
        vim.keymap.set("n", "<leader>nc", function()
          require("notify").dismiss({ silent = true, pending = true })
        end, { desc = "Close Notifications" })

        -- Function to show macro recording status
        local macro_notify_id = nil
        local function show_macro_recording()
          local reg = vim.fn.reg_recording() -- Get the current recording register
          if reg == "" then return end -- If no register, do nothing

          -- If a notification exists, dismiss it before creating a new one
          if macro_notify_id then
            notify.dismiss({ id = macro_notify_id })
          end

          -- Show recording notification with persistent timeout
          -- macro_notify_id = notify("Recording Macro...", "warn", { timeout = 0 }) -- Persistent notification
          macro_notify_id = require("notify")(string.format("Recording Macro Key: %s", reg), "warn", { timeout = false }) -- Persist until dismissed
        end

        local function clear_macro_recording()
          if macro_notify_id then
            notify.dismiss({ id = macro_notify_id })
            macro_notify_id = notify("Record ends", "warn")
          end
        end

        -- Autocommands to detect macro recording state
        vim.api.nvim_create_autocmd("RecordingEnter", {
          callback = function()
            show_macro_recording()
          end,
        })

        vim.api.nvim_create_autocmd("RecordingLeave", {
          callback = function()
            clear_macro_recording()
          end,
        })
      end,
		},
	},
}
