vim.keymap.set("n", "<leader>dn", "<cmd>lua require('dap-python').test_method()<CR>")
vim.keymap.set("n", "<leader>df", "<cmd>lua require('dap-python').test_class()<CR>")
vim.keymap.set("n", "<leader>ds", "<cmd>lua require('dap-python').debug_selection()<CR>")
