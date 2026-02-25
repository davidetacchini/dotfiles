return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    {
      "windwp/nvim-ts-autotag",
      opts = {},
    },
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
        "markdown",
        "markdown_inline",
        "vimdoc",
        -- "gdscript",
        -- "gdresource",
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
