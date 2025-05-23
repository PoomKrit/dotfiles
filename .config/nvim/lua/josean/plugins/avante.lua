-- Avante is a tool for coding AI using Antropic backend

-- NOTE: Custom version
return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false, -- set this if you want to always pull the latest change
	opts = {
		provider = "deepseek",
    -- auto_suggestions_provider = "deepseek", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
    openai = { -- Since deepseek itself cannot be found. So, there's a workaround on setup the openai with deepseek api url instead
      endpoint = "https://api.deepseek.com/v1",
      model = "deepseek-chat",
      timeout = 30000, -- Timeout in milliseconds
      temperature = 0,
      max_tokens = 4096,
      -- optional
      api_key_name = "DEEPSEEK_API_KEY",  -- default OPENAI_API_KEY if not set
    },
    -- openai = { -- Since deepseek itself cannot be found. So, there's a workaround on setup the openai with deepseek api url instead
    --   -- model = "deepseek-reasoner", -- R1 model
    --   endpoint = "http://127.0.0.1:11434/v1",
    --   model = "deepseek-r1:8b",
    --   timeout = 30000, -- Timeout in milliseconds
    --   temperature = 0,
    --   max_tokens = 4096,
    --   -- optional
    --   api_key_name = "DEEPSEEK_API_KEY",  -- default OPENAI_API_KEY if not set
    -- },
    gemini = {
      model = "gemini-1.5-flash-8b-latest",
      -- model = "gemini-1.5-pro-latest",
      -- model = "gemini-2.0-flash"
      -- model = "gemini-2.0-flash-001"
      -- model = "gemini-2.0-flash-lite"
      -- model = "gemini-2.0-flash-lite-001"
    },
		vendors = { -- may not needed
			["ollama"] = {
				__inherited_from = "openai",
				api_key_name = "",
				endpoint = "http://127.0.0.1:11434/v1",
				model = "deepseek-r1:8b",
        disable_tools = true,
			},
			["deepseek"] = {
				__inherited_from = "openai",
        api_key_name = "DEEPSEEK_API_KEY",  -- default OPENAI_API_KEY if not set
        endpoint = "https://api.deepseek.com",
        model = "deepseek-chat",
        disable_tools = true,
			},
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}

-- NOTE: default version
-- return {
--   "yetone/avante.nvim",
--   event = "VeryLazy",
--   lazy = false,
--   version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
--   opts = {
--     -- add any opts here
--   },
--   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--   build = "make",
--   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--   dependencies = {
--     "stevearc/dressing.nvim",
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     --- The below dependencies are optional,
--     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
--     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--     "zbirenbaum/copilot.lua", -- for providers='copilot'
--     {
--       -- support for image pasting
--       "HakonHarnes/img-clip.nvim",
--       event = "VeryLazy",
--       opts = {
--         -- recommended settings
--         default = {
--           embed_image_as_base64 = false,
--           prompt_for_file_name = false,
--           drag_and_drop = {
--             insert_mode = true,
--           },
--           -- required for Windows users
--           use_absolute_path = true,
--         },
--       },
--     },
--     {
--       -- Make sure to set this up properly if you have lazy=true
--       'MeanderingProgrammer/render-markdown.nvim',
--       opts = {
--         file_types = { "markdown", "Avante" },
--       },
--       ft = { "markdown", "Avante" },
--     },
--   },
-- }
