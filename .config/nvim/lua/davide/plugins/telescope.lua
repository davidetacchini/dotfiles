return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local last_search = ""

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

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Fuzzy search through git files" })
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Search for a string in cwd" })

    -- Modify the live_grep mapping to use the stored search
    vim.keymap.set("n", "<leader>fs", function()
      builtin.live_grep({ default_text = last_search })
    end, { desc = "Search for a string in cwd" })

    -- Add an autocmd to save the search when leaving telescope
    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopeKeymap",
      callback = function()
        local prompt = require("telescope.actions.state").get_current_line()
        if prompt ~= "" then
          last_search = prompt
        end
      end,
    })

    vim.keymap.set(
      "n",
      "<leader>fc",
      builtin.grep_string,
      { desc = "Searches for a string under cursor or selection in cwd" }
    )
  end,
}
