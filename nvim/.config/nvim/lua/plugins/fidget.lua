return {
  "j-hui/fidget.nvim",
  config = function()
    require("fidget").setup({
      notification = {
        window = {
          winblend = 0,
          tabstop = 4,
        },
      },
    })
  end,
}
