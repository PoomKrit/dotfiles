return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'echasnovski/mini.nvim',
    },
    opts = {},
    -- config = function()
    --     local hl = vim.api.nvim_set_hl
    --
    --     -- Define custom highlight for code blocks
    --     hl(0, "MarkdownCodeBlockNormal", { bg = "#44475a", fg = "#f8f8f2", bold = true })
    --
    --     -- Link Treesitter groups
    --     hl(0, "@markup.raw.block.markdown", { link = "MarkdownCodeBlockNormal" })
    --     hl(0, "@text.literal.markdown", { link = "MarkdownCodeBlockNormal" })
    --
    --     -- Enable Treesitter highlighting
    --     require('nvim-treesitter.configs').setup({
    --         ensure_installed = { "markdown", "markdown_inline" },
    --         highlight = {
    --             enable = true,
    --             additional_vim_regex_highlighting = { "markdown" },
    --         },
    --     })
    --
    --     -- Autocommands for persistent highlights
    --     vim.api.nvim_exec([[
    --         augroup MarkdownHighlightFix
    --             autocmd!
    --             autocmd FileType markdown highlight MarkdownCodeBlockNormal guibg=#44475a guifg=#f8f8f2 gui=bold
    --             autocmd FileType markdown highlight @markup.raw.block.markdown guibg=#44475a guifg=#f8f8f2 gui=bold
    --             autocmd FileType markdown highlight @text.literal.markdown guibg=#44475a guifg=#f8f8f2 gui=bold
    --         augroup END
    --     ]], false)
    -- end,
}
