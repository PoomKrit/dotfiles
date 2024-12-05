-- PERF: opening new tab instead of buffer
--[[
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    -- Check if the file is a directory
    local is_directory = vim.fn.isdirectory(data.file) == 1

    -- Open NvimTree if it's a directory
    if is_directory then
      require("nvim-tree.api").tree.open()
    -- Open NvimTree if the file is empty or blank (default behavior)
    elseif data.file == "" or data.file == nil then
      require("nvim-tree.api").tree.toggle()
    -- Open NvimTree alongside the opened file
    else
      require("nvim-tree.api").tree.open()
    end
  end,
})
]]

-- NOTE: stable version
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})
	end,
}

-- TEST: making each nvimtree distinct in each tab - not working
-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	dependencies = "nvim-tree/nvim-web-devicons",
-- 	config = function()
-- 		local nvimtree = require("nvim-tree")
--
-- 		-- recommended settings from nvim-tree documentation
-- 		vim.g.loaded_netrw = 1
-- 		vim.g.loaded_netrwPlugin = 1
--
-- 		-- enable 'autochdir' for distinct directories in each tab
-- 		vim.opt.autochdir = true
--
-- 		nvimtree.setup({
-- 			view = {
-- 				width = 35,
-- 				relativenumber = true,
-- 			},
-- 			-- change folder arrow icons
-- 			renderer = {
-- 				indent_markers = {
-- 					enable = true,
-- 				},
-- 				icons = {
-- 					glyphs = {
-- 						folder = {
-- 							arrow_closed = "", -- arrow when folder is closed
-- 							arrow_open = "", -- arrow when folder is open
-- 						},
-- 					},
-- 				},
-- 			},
-- 			-- ensure root syncs with current working directory
-- 			sync_root_with_cwd = true,
-- 			respect_buf_cwd = true,
-- 			-- disable window_picker for explorer to work well with window splits
-- 			actions = {
-- 				open_file = {
-- 					window_picker = {
-- 						enable = false,
-- 					},
-- 				},
-- 			},
-- 			filters = {
-- 				custom = { ".DS_Store" },
-- 			},
-- 			git = {
-- 				ignore = false,
-- 			},
-- 		})
--
-- 		-- Update NvimTree's root when `DirChanged` event is triggered
-- 		vim.api.nvim_create_autocmd("DirChanged", {
-- 			callback = function()
-- 				require("nvim-tree.api").tree.change_root(vim.fn.getcwd())
-- 			end,
-- 		})
-- 	end,
-- }
