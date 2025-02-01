-- Table of content
-- NOTE: default
return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Table of Content" },
	},
	opts = {
		symbol_folding = {
			-- Unfold entire symbol tree by default with false, otherwise enter a
			-- number starting from 1
			autofold_depth = false,
			-- autofold_depth = 1,
		},
	},
}

