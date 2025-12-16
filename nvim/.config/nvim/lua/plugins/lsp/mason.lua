return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "emmet_language_server",
        "bashls",
        "rust_analyzer",
        "tailwindcss",
        "clangd",
        -- "ruff", <-- removed because pipx manages it
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "pyright",
        "stylua",
        "prettier",
        "clang-format",
        -- "mypy", <-- removed because pipx manages it
        -- "ruff", <-- removed because pipx manages it
      },
    })
  end,
}
