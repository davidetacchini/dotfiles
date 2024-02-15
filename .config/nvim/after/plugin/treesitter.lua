local config =  require("nvim-treesitter.configs")
config.setup({
    ensure_installed = { "vimdoc", "lua", "python", "c", "cpp", "javascript", "typescript", "html", "css", "htmldjango" },
    highlight = { enable = true },
})

