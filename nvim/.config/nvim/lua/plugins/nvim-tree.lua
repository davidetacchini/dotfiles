return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    -- Recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 35,
      },
      -- Disable window_picker for explorer to work well with window splits
      actions = {
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
    vim.keymap.set(
      "n",
      "<leader>tf",
      "<cmd>NvimTreeFindFileToggle<cr>",
      { desc = "Toggle file explorer on current file" }
    )
    vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<cr>", { desc = "Collapse file explorer" })
    vim.keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh file explorer" })
  end,
}
