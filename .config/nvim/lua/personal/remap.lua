vim.g.mapleader = " "

-- Move up/down the selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor position mid screen when going page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Prevent the cursor to move at eol when appending bottom line to current line
vim.keymap.set("n", "J", "mzJ`z")

-- Prevent the override selection to be placed in the 'paste buffer' (?)
vim.keymap.set("x", "<leader>p", [["_dP]])

