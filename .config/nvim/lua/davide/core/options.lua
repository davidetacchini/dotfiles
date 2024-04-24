vim.opt.guicursor = ""
vim.opt.mouse = ""

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true

vim.opt.wrap = false

vim.opt.hlsearch = false

vim.opt.splitright = true

vim.opt.smartindent = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.updatetime = 100

vim.api.nvim_create_autocmd("FileType", {
	pattern = "html,css,scss,javascript,typescript,javascriptreact,typescriptreact",
	callback = function()
        vim.opt_local.softtabstop = 2
		vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
	end,
})
