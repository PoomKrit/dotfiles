require("josean.core")
require("josean.lazy")

-- Enable mouse in all modes
vim.opt.mouse = "a"

-- Invert horizontal scrolling
vim.api.nvim_set_keymap("n", "<ScrollWheelLeft>", "z5l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<ScrollWheelRight>", "z5h", { noremap = true, silent = true })
vim.opt.conceallevel = 2
