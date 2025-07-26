return {
  "folke/trouble.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "Trouble" },
  keys = {
    { "<leader>xx", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics (Telescope)" },
    { "<leader>xX", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Buffer Diagnostics (Telescope)" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
    { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    { "<leader>xt", "<cmd>Trouble telescope toggle<cr>", desc = "Telescope Results (Trouble)" },
  },
}
