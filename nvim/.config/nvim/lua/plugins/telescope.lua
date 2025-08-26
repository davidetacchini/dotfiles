return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  keys = {
    { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Fuzzy search through git files" },
    {
      "<leader>fs",
      function()
        local last_query = vim.g.last_live_grep_query or ""
        require("telescope.builtin").live_grep({
          default_text = last_query,
          attach_mappings = function(prompt_bufnr, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            -- Save query when selecting an item
            map("i", "<CR>", function(bufnr)
              local picker = action_state.get_current_picker(bufnr)
              if picker then
                local query = picker:_get_prompt()
                if query and query ~= "" then
                  vim.g.last_live_grep_query = query
                end
              end
              actions.select_default(bufnr)
            end)

            map("n", "<CR>", function(bufnr)
              local picker = action_state.get_current_picker(bufnr)
              if picker then
                local query = picker:_get_prompt()
                if query and query ~= "" then
                  vim.g.last_live_grep_query = query
                end
              end
              actions.select_default(bufnr)
            end)

            return true
          end,
        })
      end,
      desc = "Search for a string in cwd",
    },
    { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Search string under cursor" },
    { "<leader>fp", "<cmd>Telescope pickers<cr>", desc = "Show all cached telescope pickers" },
    { "<leader>xx", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics (Telescope)" },
    { "<leader>xX", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Buffer Diagnostics (Telescope)" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local open_with_trouble = require("trouble.sources.telescope").open
    local add_to_trouble = require("trouble.sources.telescope").add

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        cache_picker = { num_pickers = 10 },
        mappings = {
          i = {
            ["<c-t>"] = open_with_trouble,
            ["<c-a>"] = add_to_trouble,
          },
          n = {
            ["<c-t>"] = open_with_trouble,
            ["<c-a>"] = add_to_trouble,
          },
        },
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
