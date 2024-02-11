local config =  require("nvim-treesitter.configs")
config.setup({
    ensure_installed = { "lua", "python", "c", "cpp", "javascript", "typescript" },
    highlight = { enable = true },
    indent = { enable = true },
})

