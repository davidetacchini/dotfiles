return {
	"declancm/maximize.nvim",
	config = function()
		local maximize = require("maximize")
		maximize.setup({
            default_keymaps = false,
        })
		vim.keymap.set("n", "<leader>m", maximize.toggle, { desc = "Maximize current split" })
	end,
}
