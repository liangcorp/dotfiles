local keymap = vim.keymap
-- keymap.set("n", "<space>ls", ":LspStart<CR>", { desc = "[L]SP [S]tart" })
keymap.set("n", "<space>lS", ":LspStop<CR>", { desc = "[L]SP [S]top" })
