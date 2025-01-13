-- NOTE: Initial version: without template
-- return {
-- 	"epwalsh/obsidian.nvim",
-- 	version = "*",
-- 	lazy = true,
-- 	ft = "markdown",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 	},
-- 	opts = {
-- 		workspaces = {
-- 			{
-- 				name = "ObsidianMobile",
-- 				path = "/Users/poomkrit/Library/Mobile Documents/iCloud~md~obsidian/Documents/ObsidianMobile",
-- 			},
-- 		},
-- 		templates = {
-- 			subdir = "templates", -- Specify the templates folder
-- 			date_format = "%Y-%m-%d", -- Date format for template usage
-- 			time_format = "%H:%M:%S", -- Time format for template usage
-- 		},
-- 		new_notes_location = ""current_dir"", -- Where new notes are created
-- 	},
-- }

---------------------------------------------------

-- HACK: Stable version: creating default tag
return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "ObsidianMobile",
				path = "/Users/poomkrit/Library/Mobile Documents/iCloud~md~obsidian/Documents/ObsidianMobile",
			},
		},
		templates = {
			subdir = "templates", -- Specify the templates folder
			date_format = "%Y-%m-%d-%a", -- Date format for template usage
			time_format = "%H:%M", -- Time format for template usage
      default_template = "nvim-template.md" -- Specify the template to use for new notes
		},
    attachments = {
      img_folder = "images",
    },
		new_notes_location = "current_dir", -- Where new notes are created
		note_frontmatter_func = function(note)
			-- Extract the folder name from the note's path
			-- local folder_name = vim.fn.fnamemodify(note.path, ":h:t")
			return {
				id = note.id or note.title, -- Ensure we always have an ID
				aliases = note.aliases or {}, -- Ensure aliases is always a table
				tags = note.tags or {}, -- Use the safely constructed tags
				date = os.date("%Y-%m-%d-%a"), -- Insert current date
			}
		end,
	},
}

---------------------------------------------------

-- TEST: Testing version
-- return {
--     "epwalsh/obsidian.nvim",
--     version = "*",
--     lazy = true,
--     ft = "markdown",
--     dependencies = {
--         "nvim-lua/plenary.nvim",
--     },
--     opts = {
--         workspaces = {
--             {
--                 name = "ObsidianMobile",
--                 path = "/Users/poomkrit/Library/Mobile Documents/iCloud~md~obsidian/Documents/ObsidianMobile",
--             },
--         },
--         templates = {
--             subdir = "templates",
--             date_format = "%Y-%m-%d-%a",
--             time_format = "%H:%M",
--             -- Specify the template to use for new notes
--             default_template = "nvim-template.md",
--         },
--         -- note_id_func = function(title)
--         --     -- This will be used for the 'id' field
--         --     return title
--         -- end,
--         -- -- Add these custom functions
--         -- custom_date_func = function()
--         --     return os.date("%Y-%m-%d")
--         -- end,
--         -- parent_folder_func = function(path)
--         --     -- Extract parent folder name from the path
--         --     return vim.fn.fnamemodify(path, ":h:t")
--         -- end,
--         -- -- Use the template variables in the frontmatter
--         -- note_frontmatter_func = function(note)
--         --     local out = {
--         --         id = note.id,
--         --         aliases = {},
--         --         tags = {},
--         --     }
--         --     -- Get the parent folder
--         --     local parent_folder = require("obsidian").parent_folder_func(note.path)
--         --     if parent_folder then
--         --         table.insert(out.tags, parent_folder)
--         --     end
--         --     -- Set dates
--         --     out.date = os.date("%Y-%m-%d")
--         --     out["custom date"] = require("obsidian").custom_date_func()
--         --     out["modify date"] = os.date("%Y-%m-%d")
--         --     return out
--         -- end,
--         -- new_notes_location = "root",
--     },
-- }
