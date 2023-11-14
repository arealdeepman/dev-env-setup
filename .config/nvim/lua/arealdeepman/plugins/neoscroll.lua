return {
  "karb94/neoscroll.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local neoscroll = require("neoscroll")
    neoscroll.setup({
      stop_eof = true,
    })
  end,
}
