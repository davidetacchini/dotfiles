return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "cpp",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "htmldjango",
        "tsx",
        "lua",
        "json",
        "yaml",
        "vue",
        "tmux",
        "sql",
        "bash",
        "http",
        "dockerfile",
        "vimdoc",
        -- "gdscript",
        -- "gdresource",
      },
      sync_install = true,
      auto_install = true,
      ignore_install = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      autotag = {
        enable = true,
      },
    })
  end,
}
