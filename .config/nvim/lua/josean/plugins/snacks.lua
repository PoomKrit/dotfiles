return {
    -- HACK: docs @ https://github.com/folke/snacks.nvim/blob/main/docs
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        -- NOTE: Options
        opts = {
            explorer = {
                enabled = true,
                layout = {
                    cycle = false,
                },
                filters = { -- 👈 This ensures hidden files are displayed
                    hide_dotfiles = false, -- Show dotfiles (e.g., .git, .config, .env)
                    hide_gitignored = false, -- Show git-ignored files
                },
            },
            quickfile = {
                enabled = true,
                exclude = { "latex" },
            },
            -- HACK: read picker docs @ https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
            picker = {
                enabled = true,
                layout = {
                    -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
                    -- override picker layout in keymaps function as a param below
                    preset = "telescope", -- defaults to this layout unless overidden
                    cycle = false,
                },
                layouts = {
                    select = {
                            preview = false,
                            layout = {
                                backdrop = false,
                                width = 0.6,
                                min_width = 80,
                                height = 0.4,
                                min_height = 10,
                                box = "vertical",
                                border = "rounded",
                                title = "{title}",
                                title_pos = "center",
                                { win = "input", height = 1, border = "bottom" },
                                { win = "list", border = "none" },
                                { win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
                        }
                    },
                    telescope = {
                        reverse = true, -- set to false for search bar to be on top 
                        layout = {
                            box = "horizontal",
                            backdrop = false,
                            width = 0.8,
                            height = 0.9,
                            border = "none",
                            {
                                box = "vertical",
                                { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                                { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
                            },
                            {
                                win = "preview",
                                title = "{preview:Preview}",
                                width = 0.50,
                                border = "rounded",
                                title_pos = "center",
                            },
                        },
                    },
                    ivy = {
                        layout = {
                            box = "vertical",
                            backdrop = false,
                            width = 0,
                            height = 0.4,
                            position = "bottom",
                            border = "top",
                            title = " {title} {live} {flags}",
                            title_pos = "left",
                            { win = "input", height = 1, border = "bottom" },
                            {
                                box = "horizontal",
                                { win = "list", border = "none" },
                                { win = "preview", title = "{preview}", width = 0.5, border = "left" },
                            },
                        },
                    },
                }
            },
            dashboard = {
                enabled = true,
                sections = {
                    { section = "header" },
                    { section = "keys", gap = 1, padding = 1 },
                    { section = "startup", },
                },
            },
            image = {
                enabled = true,
                doc = {
                    inline = vim.g.neovim_mode == "skitty" and true or false,
                    float = true,  -- Use floating window for image preview
                    -- only_render_image_at_cursor = true
                    max_width = vim.g.neovim_mode == "skitty" and 20 or 25,  -- Slightly reduce width
                    max_height = vim.g.neovim_mode == "skitty" and 10 or 12, -- Slightly reduce height
                    border = "rounded",  -- Add a border to define window edges
                    padding = 1,  -- Reduce padding to prevent excessive space

                    -- Fine-tune floating window position
                    -- float_opts = {
                    --     relative = "cursor",  -- Position relative to the cursor
                    --     row = 2,              -- Move further down
                    --     col = 8,              -- Move further to the right
                    --     anchor = "NW",        -- Anchor top-left corner of the window
                    --     focusable = false,    -- Prevent accidental focus on the image window
                    --     style = "minimal",    -- Prevent additional decorations
                    -- },
                },
            }
        },
        -- NOTE: Keymaps
        keys = {
            { "<leader>lg", function() require("snacks").lazygit() end, desc = "Lazygit" },
            { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Logs" },
            -- { "<leader>es", function() require("snacks").explorer({ hidden = true, ignore = false }) end, desc = "Open Snacks Explorer (Show Hidden Files)" },
            { "<leader>e", function() require("snacks").explorer({ hidden = true, ignore = true }) end, desc = "Open Snacks Explorer (Show Hidden & Ignored Files)" },
            { "<leader>rN", function() require("snacks").rename.rename_file() end, desc = "Fast Rename Current File" },
            -- { "<leader>dB", function() require("snacks").bufdelete() end, desc = "Delete or Close Buffer  (Confirm)" },

            -- Snacks Picker
            { "<leader>pf", function() require("snacks").picker.files({ hidden = true }) end, desc = "Find Files (Including Hidden)" },
            { "<leader>pc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config"), hidden = true }) end, desc = "Find Config File (Including Hidden)" },
            { "<leader>pr", function() require("snacks").picker.recent() end, desc = "Open Recent files" },
            { "<leader>pg", function() require("snacks").picker.grep({ hidden = true }) end, desc = "Grep word (Including Hidden Files)" },
            { "<leader>pw", function() require("snacks").picker.grep_word({ hidden = true }) end, desc = "Search Visual Selection or Word (Including Hidden Files)", mode = { "n", "x" } },
            { "<leader>pk", function() require("snacks").picker.keymaps({ layout = "ivy" }) end, desc = "Search Keymaps (Snacks Picker)" },
            { "<leader>pb", function() require("snacks").picker.buffers() end, desc = "List all buffers" },
            { "<leader>ph", function() require("snacks").picker.help() end, desc = "Help Pages" },
            -- { "<leader>vh", function() require("snacks").picker.help() end, desc = "Help Pages" },

            -- Git Stuff
            { "<leader>co", function() require("snacks").picker.git_branches({ layout = "select" }) end, desc = "Pick and Switch Git Branches" },

            -- Other Utils
            { "<leader>th" , function() require("snacks").picker.colorschemes({ layout = "ivy" }) end, desc = "Pick Color Schemes"},
        }
    },
    -- NOTE: todo comments w/ snacks
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        optional = true,
        keys = {
            { "<leader>pt", function() require("snacks").picker.todo_comments({ hidden = true }) end, desc = "Todo" },
            { "<leader>pT", function() require("snacks").picker.todo_comments({ hidden = true, keywords = { "TODO", "HACK", "NOTE" } }) end, desc = "Todo/Hack/Note" },
        },
    }
}

