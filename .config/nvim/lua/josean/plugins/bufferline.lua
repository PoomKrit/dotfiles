return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs", -- Try "buffers" or "tabs"
      separator_style = "slant", -- Try different styles
      -- Other useful options:
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      color_icons = true,
    },
  },
}
