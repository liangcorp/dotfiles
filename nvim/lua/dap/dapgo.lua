require('dap-go').setup {}

vim.keymap.set("n", "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>")
