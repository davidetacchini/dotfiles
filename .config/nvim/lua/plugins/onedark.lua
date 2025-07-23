return {
  "navarasu/onedark.nvim",
  priority = 1000,
  lazy = false, -- Load immediately since it's the colorscheme
  config = function()
    require("onedark").setup({
      transparent = true,
      code_style = {
        comments = "none",
      },
      diagnostics = {
        background = false,
      },
    })
    vim.cmd.colorscheme("onedark")

    -- Remove background from floating windows (e.g. lsp.buf.hover or lsp.buf.signature_help)
    local set_hl_for_floating_window = function()
      vim.api.nvim_set_hl(0, "NormalFloat", {
        link = "Normal",
      })
      vim.api.nvim_set_hl(0, "FloatBorder", {
        bg = "none",
      })
    end

    set_hl_for_floating_window()

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      desc = "Avoid overwritten by loading color schemes later",
      callback = set_hl_for_floating_window,
    })
  end,
}
