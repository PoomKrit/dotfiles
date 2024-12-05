-- return {
-- 	{
-- 		"iamcco/markdown-preview.nvim",
-- 		build = "cd app && npm install",
-- 		enabled = true,
-- 		ft = { "markdown" },
-- 		config = function()
-- 			-- Automatically start Markdown Preview
-- 			vim.g.mkdp_auto_start = 1
--
-- 			-- Automatically close Markdown Preview when buffer is closed
-- 			vim.g.mkdp_auto_close = 1
--
-- 			-- Use dark theme for the preview
-- 			vim.g.mkdp_theme = "dark"
--
-- 			-- Keymap to manually toggle Markdown Preview
-- 			vim.api.nvim_set_keymap("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { noremap = true, silent = true })
-- 		end,
-- 	},
-- }

return {
	"davidgranstrom/nvim-markdown-preview",
	build = "cd app && npm install",
	enabled = true,
	ft = { "markdown" },
	config = function()
		-- Automatically start Markdown Preview
		vim.g.mkdp_auto_start = 1

		-- Automatically close Markdown Preview when buffer is closed
		vim.g.mkdp_auto_close = 1

		-- Use dark theme for the preview
		vim.g.mkdp_theme = "dark"

		-- Keymap to manually toggle Markdown Preview
		vim.api.nvim_set_keymap("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { noremap = true, silent = true })
	end,
}
