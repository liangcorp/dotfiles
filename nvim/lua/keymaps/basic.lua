local keymap = vim.keymap

-- Neovim native shortcuts
vim.g.mapleader = '\\'

keymap.set('t', "<Esc>", "<C-\\><C-n>")
-- Move block of code up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep curser in the same position
keymap.set("n", "J", "mzJ`z")

-- Keep curser in the middle of screen during move
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Copy all
keymap.set('n', '<C-y>', '99999yy')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Search Toggle Highlight
keymap.set('n', '<leader>hl', ':set hlsearch!<cr>',
    { desc = "[H]ighlight [T]oggle" })

-- Split panels
keymap.set('n', '<leader>sh', ':split<Return><C-w>w',
    { desc = "[S]plit [H]orizontal" })
keymap.set('n', '<leader>sv', ':vsplit<Return><C-w>w',
    { desc = "[S]plit [V]ertical" })

-- Close everything else
keymap.set('n', '<leader>so', ':only<CR>', { desc = "Close Other" })

-- Paste over the highlighted word with copied word
keymap.set("x", "<leader>p", "\"_dP", { desc = '[P]aste Over' })

-- User system clip board
keymap.set("n", "<leader>y", "\"+y", { desc = "System Paste" })
keymap.set("v", "<leader>y", "\"+y", { desc = "System Paste" })
keymap.set("n", "<leader>Y", "\"+Y", { desc = "System Paste" })

-- Search terms stay on the middle line
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
