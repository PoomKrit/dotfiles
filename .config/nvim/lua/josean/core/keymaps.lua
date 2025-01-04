-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sn", ":vnew<CR>", { desc = "Open Blank Splitted window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>s=", "<C-w>=", { desc = "Set equally pane" })

-- switch buffer pane

keymap.set("n", "W", ":w<CR>", { desc = "Save file" })
keymap.set("n", "T", "gg", { desc = "Go to top page in normal mode" })
keymap.set("x", "T", "gg", { desc = "Go to top page in visual mode" })
keymap.set("n", "<M-`>", "<C-w>w", { desc = "Move to other pane" })
keymap.set("n", "<M-h>", "<C-w>h", { desc = "Move to left pane" })
keymap.set("n", "<M-l>", "<C-w>l", { desc = "Move to right pane" })
keymap.set("n", "<M-k>", "<C-w>k", { desc = "Move to up pane" })
keymap.set("n", "<M-j>", "<C-w>j", { desc = "Move to down pane" })
keymap.set("n", "<M-t>", ":tabnew<CR>", { desc = "Create new tab" })
keymap.set("n", "<M-]>", ":tabnext<CR>", { desc = "Move to other tab" })
keymap.set("n", "<M-[>", ":tabprevious<CR>", { desc = "Move to other tab" })
keymap.set("n", "<M-r>", "<C-w>r", { desc = "Swap pane" })
-- keymap.set("n", "<M-m>", "gcc", { desc = "Comment line" }) -- not working
keymap.set("n", "<M-1>", ":e!<CR>", { desc = "Reset file" })
keymap.set("n", "<M-=>", "<C-w>=", { desc = "Adjust panes equally" })
keymap.set("n", "<M-q>", ":q<CR>", { desc = "Quit current window" })
keymap.set("n", "<M-Q>", ":qa<CR>", { desc = "Quit all windows" })
keymap.set("n", "T", "gg", { desc = "Go to beginning of the file" })
keymap.set("n", "<M-.>", ":bn<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<M-,>", ":bp<CR>", { desc = "Go to previous buffer" })
keymap.set("n", "<M-w>", ":bd<CR>", { desc = "Close buffer" })
keymap.set("n", "<M-W>", ":bd!<CR>", { desc = "Force close buffer" })
keymap.set("n", "dt", ":diffthis<CR>", { desc = "Select current pane to diff mode" })
keymap.set("n", "do", ":diffoff<CR>", { desc = "Quit from diff mode" })

-- making Fgrep and file command
--[[
vim.api.nvim_create_user_command("Fgrep", function(args)
  vim.fn["fzf#vim#grep"](
    "rg --hidden --column --line-number --no-heading --color=always " .. vim.fn.shellescape(args.args),
    0,
    {}
  )
end, { bang = true, nargs = "*" })
]]
-- keymap.set("n", "<M-f>", ":Files<CR>", { desc = "Find files with Fzf" })
-- keymap.set("n", "<M-d>", ":Fgrep<CR>", { desc = "Search using grep with Fzf" })

-- keymap.set("n", "<M->bd", ":bd<CR>", { desc = "Close buffer without closing NERDTree" })
-- command for copying file path and directory path
vim.api.nvim_create_user_command("YankFilePath", function()
	local file_path = vim.fn.expand("%:p")
	vim.fn.setreg("+", file_path)
	print("Copied file path: " .. file_path)
end, { desc = "Copy the full file path to the clipboard" })

vim.api.nvim_create_user_command("YankDir", function()
	local dir_path = vim.fn.expand("%:p:h")
	vim.fn.setreg("+", dir_path)
	print("Copied directory: " .. dir_path)
end, { desc = "Copy the directory path to the clipboard" })
keymap.set("n", "<leader>a", ":Buffers<CR>", { desc = "Show all buffers" })
keymap.set("n", "y", '"+y', { desc = "Yank to clipboard" })
keymap.set("v", "y", '"+y', { desc = "Yank to clipboard in visual mode" })
keymap.set("n", "<leader>p", ":YankFilePath<CR>", { desc = "Copy file path" })
keymap.set("n", "<leader>P", ":YankDir<CR>", { desc = "Copy directory path" })
-- keymap.set("n", "nh", ":noh<CR>", { desc = "Clear highlighted search" }) | avoiding delay on using 'n' for next search

-- keymap file-explorer
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
-- keymap.set("n", "<leader>ec", "<cmd>NvimTreeClose<CR>", { desc = "Close explorer" }) -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>eF", "<cmd>NvimTreeFindFile<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- keymaps for telescope fzf
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files({
		find_command = { "fd", "--type", "f", "--follow" },
	})
end, { desc = "Fuzzy find files (include symlinks)" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set(
	"n",
	"<leader>fw",
	"<cmd>Telescope live_grep<cr>",
	{ desc = "Find string or word in current work directory" }
)
keymap.set(
	"n",
	"<leader>fc",
	"<cmd>Telescope grep_string<cr>",
	{ desc = "Find string under cursor in current work directory" }
)
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffers in cwd" })

-- keymaps for auto-sessions
keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for current work directory" }) -- restore last workspace session for current directory
keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

-- keymaps for markdownpreview
keymap.set(
	"n",
	"<leader>md",
	"<cmd>MarkdownPreview<CR>",
	{ desc = "Open Markdown Preview", noremap = true, silent = true }
) -- Toggle markdownpreview
