return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
      check_ts = true, -- Use treesitter for better pair detection
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false, -- Don't check treesitter on java
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
    })

    -- Integration with nvim-cmp
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- Custom rules for specific filetypes
    local Rule = require("nvim-autopairs.rule")

    -- Add spaces inside brackets for function calls
    autopairs.add_rules({
      Rule(" ", " "):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ "()", "[]", "{}" }, pair)
      end),
      Rule("( ", " )")
        :with_pair(function()
          return false
        end)
        :with_move(function(opts)
          return opts.prev_char:match(".%)") ~= nil
        end)
        :use_key(")"),
      Rule("{ ", " }")
        :with_pair(function()
          return false
        end)
        :with_move(function(opts)
          return opts.prev_char:match(".%}") ~= nil
        end)
        :use_key("}"),
      Rule("[ ", " ]")
        :with_pair(function()
          return false
        end)
        :with_move(function(opts)
          return opts.prev_char:match(".%]") ~= nil
        end)
        :use_key("]"),
    })
  end,
}
