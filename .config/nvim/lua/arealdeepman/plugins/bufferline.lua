return {
  -- add tabs to bufferline
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
      offsets = {
        {
          filetype = "NvimTree",
          text = "Explorer",
          text_align = "left",
          separator = true
        }
      },
    },
  },
}
