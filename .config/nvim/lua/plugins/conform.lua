return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        vue = { "prettier" },
        htmldjango = { "djlint" },
        bash = { "shfmt" },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({
        timeout_ms = 1000,
        lsp_fallback = true,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
