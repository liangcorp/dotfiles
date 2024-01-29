local keymap = vim.keymap

-- NVIM Tree
local nvim_tree = require('nvim-tree.api')

keymap.set('n', "<leader>zz", function() nvim_tree.tree.toggle() end, { desc = "Nvim Tree" })
