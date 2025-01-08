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
-- 		new_notes_location = "root", -- Where new notes are created
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
			date_format = "%Y-%m-%d", -- Date format for template usage
			time_format = "%H:%M:%S", -- Time format for template usage
		},
		new_notes_location = "root", -- Where new notes are created
		note_frontmatter_func = function(note)
			-- Dynamically generate frontmatter for new notes
			return {
				id = note.id or note.title, -- Use note ID or title
				aliases = { note.title }, -- Set title as default alias
				tags = {}, -- Default tags (can be customized)
				date = os.date("%Y-%m-%d"), -- Insert current date
			}
		end,
	},
}

---------------------------------------------------

-- TEST: Testing version
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
-- 		new_notes_location = "root", -- Where new notes are created
-- 		note_frontmatter_func = function(note)
-- 			-- Dynamically generate frontmatter for new notes
-- 			return {
-- 				id = note.id or note.title, -- Use note ID or title
-- 				aliases = { note.title }, -- Set title as default alias
-- 				tags = { note.path }, -- Default tags (can be customized)
-- 				date = os.date("%Y-%m-%d"), -- Insert current date
-- 			}
-- 		end,
-- 	},
-- }
