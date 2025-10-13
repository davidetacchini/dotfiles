return {
  "mistweaverco/kulala.nvim",
  keys = {
    { "<leader>zs", desc = "Send request" },
    { "<leader>za", desc = "Send all requests" },
    { "<leader>zb", desc = "Open scratchpad" },
  },
  ft = { "http", "rest" },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = "<leader>z",
    kulala_keymaps_prefix = "",
  },
}
