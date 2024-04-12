return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
			vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})

			require("telescope").setup({
				defaults = {
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
			require("telescope").load_extension("ui-select")
		end,
	},
}
