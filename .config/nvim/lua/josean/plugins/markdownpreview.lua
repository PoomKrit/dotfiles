-- return {
-- 	"davidgranstrom/nvim-markdown-preview",
-- 	config = function()
-- 		-- Key mapping to toggle Markdown preview
-- 		vim.api.nvim_set_keymap("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { noremap = true, silent = true })
--
-- 		-- Optionally configure custom settings for the plugin
-- 		vim.g.nvim_markdown_preview_theme = "solarized-light" -- Theme for preview
-- 		vim.g.nvim_markdown_preview_auto_start = 1 -- Automatically start preview when opening markdown file
-- 		-- vim.g.nvim_markdown_preview_browser = "firefox" -- Choose your browser
-- 	end,
-- 	ft = { "markdown" }, -- Load the plugin only for markdown files
-- }

-- NOTE: install with yarn or npm
return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
}

-- NOTE: install without yarn or npm
-- return {
-- 	"iamcco/markdown-preview.nvim",
-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
-- 	ft = { "markdown" },
-- 	build = function()
-- 		vim.fn["mkdp#util#install"]()
-- 	end,
-- }
