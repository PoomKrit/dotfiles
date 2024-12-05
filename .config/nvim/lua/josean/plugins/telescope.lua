-- NOTE: this is a good version from josean
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}

-- FIX: this open new tab but this doesn't open new file in blank tab
-- return {
--   "nvim-telescope/telescope.nvim",
--   branch = "0.1.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--     "nvim-tree/nvim-web-devicons",
--     "folke/todo-comments.nvim",
--   },
--   config = function()
--     local telescope = require("telescope")
--     local actions = require("telescope.actions")
--
--     -- Custom picker for listing open tabs
--     local function list_tabs(opts)
--       opts = opts or {}
--
--       -- Gather tab information
--       local tabs = {}
--       for tabnr = 1, vim.fn.tabpagenr("$") do
--         local windows = vim.fn.tabpagewinnr(tabnr, "$")
--         local tab_name = {}
--         for winnr = 1, windows do
--           local bufname = vim.fn.bufname(vim.fn.winbufnr(winnr))
--           if bufname ~= "" then
--             table.insert(tab_name, bufname)
--           end
--         end
--         table.insert(tabs, {
--           tabnr = tabnr,
--           name = table.concat(tab_name, ", "),
--         })
--       end
--
--       -- Define Telescope picker
--       telescope.pickers.new(opts, {
--         prompt_title = "Open Tabs",
--         finder = telescope.finders.new_table({
--           results = tabs,
--           entry_maker = function(entry)
--             return {
--               value = entry.tabnr,
--               display = string.format("[%d] %s", entry.tabnr, entry.name),
--               ordinal = entry.name,
--             }
--           end,
--         }),
--         sorter = telescope.config.generic_sorter(opts),
--         attach_mappings = function(_, map)
--           -- Open the selected tab
--           map("i", "<CR>", function(prompt_bufnr)
--             local selection = actions.get_selected_entry(prompt_bufnr)
--             actions.close(prompt_bufnr)
--             vim.cmd("tabnext " .. selection.value)
--           end)
--           map("n", "<CR>", function(prompt_bufnr)
--             local selection = actions.get_selected_entry(prompt_bufnr)
--             actions.close(prompt_bufnr)
--             vim.cmd("tabnext " .. selection.value)
--           end)
--           return true
--         end,
--       }):find()
--     end
--
--     telescope.setup({
--       defaults = {
--         path_display = { "smart" },
--         mappings = {
--           i = {
--             ["<C-k>"] = actions.move_selection_previous, -- move to prev result
--             ["<C-j>"] = actions.move_selection_next, -- move to next result
--             ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send to quickfix
--             ["<CR>"] = actions.select_tab, -- Open in new tab on Enter (Insert Mode)
--           },
--           n = {
--             ["<CR>"] = actions.select_tab, -- Open in new tab on Enter (Normal Mode)
--           },
--         },
--       },
--     })
--
--     -- Map custom picker to a key
--     local keymap = vim.keymap -- for conciseness
--     keymap.set("n", "<leader>tt", function()
--       list_tabs()
--     end, { desc = "List open tabs" })
--
--     telescope.load_extension("fzf")
--   end,
-- }

-- BUG: can fill the blank tab but no tabs list
-- return {
--   "nvim-telescope/telescope.nvim",
--   branch = "0.1.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--     "nvim-tree/nvim-web-devicons",
--     "folke/todo-comments.nvim",
--   },
--   config = function()
--     local telescope = require("telescope")
--     local actions = require("telescope.actions")
--     local action_state = require("telescope.actions.state")
--
--     -- Function to determine if the current tab is blank
--     local function is_tab_blank()
--       local bufname = vim.fn.bufname() -- Get the name of the current buffer
--       return bufname == "" or bufname == nil
--     end
--
--     telescope.setup({
--       defaults = {
--         path_display = { "smart" },
--         mappings = {
--           i = {
--             ["<C-k>"] = actions.move_selection_previous, -- Move to prev result
--             ["<C-j>"] = actions.move_selection_next, -- Move to next result
--             ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Send to quickfix
--             ["<CR>"] = function(prompt_bufnr)
--               local selection = action_state.get_selected_entry(prompt_bufnr)
--               actions.close(prompt_bufnr)
--               if is_tab_blank() then
--                 -- Open in the current tab if it's blank
--                 vim.cmd("edit " .. selection.value)
--               else
--                 -- Open in a new tab otherwise
--                 vim.cmd("tabnew " .. selection.value)
--               end
--             end,
--           },
--           n = {
--             ["<C-k>"] = actions.move_selection_previous,
--             ["<C-j>"] = actions.move_selection_next,
--             ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
--             ["<CR>"] = function(prompt_bufnr)
--               local selection = action_state.get_selected_entry(prompt_bufnr)
--               actions.close(prompt_bufnr)
--               if is_tab_blank() then
--                 vim.cmd("edit " .. selection.value)
--               else
--                 vim.cmd("tabnew " .. selection.value)
--               end
--             end,
--           },
--         },
--       },
--     })
--
--     telescope.load_extension("fzf")
--   end,
-- }

-- TEST: newly created script for testing
