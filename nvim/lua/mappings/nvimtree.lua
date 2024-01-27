local keymap = vim.keymap

-- NVIM Tree
-- local nvim_tree = require('nvim-tree')
keymap.set('n', "<leader>zz", function() require("nvim-tree").toggle() end, { desc = "Nvim Tree" })
