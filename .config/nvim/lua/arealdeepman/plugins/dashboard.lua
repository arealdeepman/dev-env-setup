return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dashboard = require("dashboard")
    dashboard.setup({
      theme = 'doom',
      config = {
        header = {
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
        }, --your header
        center = {
          {
            icon = ' ',
            desc = 'New File                        ',
            desc_hl = 'String',
            key = 'e',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'ene'
          },
          {
            icon = ' ',
            desc = 'Toggle File Explorer            ',
            desc_hl = 'String',
            key = 'ee',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'NvimTreeToggle'
          },
          {
            icon = '󰱼 ',
            desc = 'Find File                       ',
            desc_hl = 'String',
            key = 'ff',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Telescope find_files'
          },
          {
            icon = ' ',
            desc = 'Find Word                       ',
            desc_hl = 'String',
            key = 'fs',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Telescope live_grep'
          },
          {
            icon = ' ',
            desc = 'Quit Nvim                       ',
            desc_hl = 'String',
            key = 'q',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'q'
          },
       },
        footer = {}  --your footer
      }
    })
    -- -- Disable folding on alpha buffer
    -- vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
