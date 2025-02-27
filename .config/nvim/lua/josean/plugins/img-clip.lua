return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      dir_path = "images",  -- Change the directory from 'assets' to 'images'
      file_name = "%Y-%m-%d-%H-%M-%S",  -- Optional: use a timestamp for unique filenames
      use_absolute_path = false,  -- Use relative path for Obsidian compatibility
      -- insert_link = function(file_path)
      --   -- Insert the Obsidian-style link ![[IMG_NAME.png]]
      --   return string.format("![[%s]]", vim.fn.fnamemodify(file_path, ":t"))
      -- end,
    },
  },
  keys = {
    { "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
