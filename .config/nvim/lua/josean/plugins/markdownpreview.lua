return {
	"davidgranstrom/nvim-markdown-preview",
	config = function()
		-- Key mapping to toggle Markdown preview
		vim.api.nvim_set_keymap("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { noremap = true, silent = true })

		-- Optionally configure custom settings for the plugin
		vim.g.nvim_markdown_preview_theme = "solarized-light" -- Theme for preview
		vim.g.nvim_markdown_preview_auto_start = 1 -- Automatically start preview when opening markdown file
		-- vim.g.nvim_markdown_preview_browser = "firefox" -- Choose your browser
	end,
	ft = { "markdown" }, -- Load the plugin only for markdown files
}
