local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { 'navarasu/onedark.nvim', name = 'onedark', priority = 1000 },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    { 'williamboman/mason.nvim' }, -- lsp-zero plugins
    { 'williamboman/mason-lspconfig.nvim' }, -- lsp-zero plugins
    { 'neovim/nvim-lspconfig' }, -- lsp-zero plugin
    { 'hrsh7th/cmp-nvim-lsp' }, -- lsp-zero plugin
    { 'hrsh7th/nvim-cmp' }, -- lsp-zero plugin
    { 'L3MON4D3/LuaSnip' }, -- lsp-zero plugin
}
local opts = {}

require("lazy").setup(plugins, opts)

