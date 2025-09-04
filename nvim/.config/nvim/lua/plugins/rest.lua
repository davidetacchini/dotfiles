return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
  keys = {
    { "<leader>ro", "<cmd>Rest open<cr>", desc = "Open REST client" },
    { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run REST request under the cursor" },
    { "<leader>rc", "<cmd>Rest cookies<cr>", desc = "Edit REST cookies file" },
  },
}
