return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      transparent_background = true,
      float = {
        transparent = true,
        solid = false,
      },
      auto_integrations = true,
      no_italic = true,
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
