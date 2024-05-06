return {
	"declancm/maximize.nvim",
	config = function()
		local maximize = require("maximize")
		maximize.setup()
		vim.keymap.set("n", "<leader>m", maximize.toggle)
	end,
}
