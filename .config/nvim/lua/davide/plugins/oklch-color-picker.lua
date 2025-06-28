return {
  "eero-lehtinen/oklch-color-picker.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>v",
      function()
        require("oklch-color-picker").pick_under_cursor()
      end,
      desc = "Pick OKLCH color",
    },
  },
  opts = {},
}
