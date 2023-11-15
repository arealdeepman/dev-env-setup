return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local lualine_onedark = require("lualine.themes.onedark")

    lualine.setup({
      options = {
        theme = lualine_onedark,
        disabled_filetypes = { "NvimTree", },
      },
    })
  end,
}
