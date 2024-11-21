return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade",
      background_colour = "FloatShadow",
    })
    vim.notify = require("notify")
  end,
}
