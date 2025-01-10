-- provides automatic session management.
-- It helps you save and restore your workspace,
-- including open buffers, windows, and tab pages,
-- so you can easily continue where you left off in a project.

return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})
	end,
}
