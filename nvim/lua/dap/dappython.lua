vim.keymap.set("n", "<leader>pt", "<cmd>lua require('dap-python').test_method()<CR>")
vim.keymap.set("n", "<leader>pc", "<cmd>lua require('dap-python').test_class()<CR>")
vim.keymap.set("n", "<leader>ps", "<cmd>lua require('dap-python').debug_selection()<CR>")
