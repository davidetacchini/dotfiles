return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  keys = {
    { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Fuzzy search through git files" },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Search for a string in cwd" },
    { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Search string under cursor" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        preview = {
          -- Makes the preview faster
          timeout_hook = function(filepath, bufnr, opts)
            local cmd = { "echo", "timeout" }
            require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
          end,
          filesize_hook = function(filepath, bufnr, opts)
            local cmd = { "echo", "filesize" }
            require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
          end,
          treesitter = false,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}
