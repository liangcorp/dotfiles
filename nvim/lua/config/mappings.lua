vim.g.mapleader = '\\'

-- Move block of code up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep curser in the same position
vim.keymap.set("n", "J", "mzJ`z")

-- Keep curser in the middle of screen during move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste over the highlighted word with copied word
vim.keymap.set("x", "<leader>p", "\"_dP")

-- User system clip board
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
