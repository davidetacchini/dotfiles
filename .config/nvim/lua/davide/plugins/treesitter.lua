return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"c",
				"python",
				"javascript",
				"typescript",
				"html",
				"css",
				"htmldjango",
				"tsx",
				"lua",
				"json",
				"sql",
				"vimdoc",
				"bash",
			},
		})
	end,
}
