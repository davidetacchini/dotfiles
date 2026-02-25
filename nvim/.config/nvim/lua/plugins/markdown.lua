return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  config = function()
    require("markview").setup({})
    vim.keymap.set("n", "<leader>md", "<cmd>Markview Toggle<CR>", { desc = "Toggle markdown rendering" })
    vim.keymap.set("n", "<leader>ms", "<cmd>Markview splitToggle<CR>", { desc = "Toggle markdown split view" })
    vim.keymap.set("n", "<leader>mh", "<cmd>Markview hybridToggle<CR>", { desc = "Toggle markdown hybrid mode" })
  end,
}
