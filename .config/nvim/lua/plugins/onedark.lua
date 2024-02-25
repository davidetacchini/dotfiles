return {
	"navarasu/onedark.nvim",
	name = "onedark",
	priority = 1000,
	config = function()
		require("onedark").setup({
			transparent = true,
			code_style = {
				comments = "none",
			},
			diagnostics = {
				background = false,
			},
		})
		vim.cmd.colorscheme("onedark")
	end,
}
