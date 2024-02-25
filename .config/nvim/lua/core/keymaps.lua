vim.g.mapleader = " "

-- Move up/down the selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor position mid screen when going page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Prevent the cursor to move at eol when appending next line to current line
vim.keymap.set("n", "J", "mzJ`z")

-- Keep a buffer of the yanked selection
vim.keymap.set("x", "<leader>p", [["_dP]])
