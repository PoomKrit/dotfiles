return {
	"mistricky/codesnap.nvim",
	build = "make build_generator",
	keys = {
		-- { "<leader>cc", "<cmd>'<,'>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
		{ "<leader>cs", "<cmd>'<,'>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Downloads" },
	},
	opts = {
		save_path = "~/Downloads",
		has_breadcrumbs = true,
		bg_theme = "bamboo",
	},
}
