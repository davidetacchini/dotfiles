return {
  "rcarriga/nvim-notify",
  enabled = false,
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade",
      background_colour = "FloatShadow",
    })
    vim.notify = require("notify")
  end,
}
