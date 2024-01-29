local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Trouble
local trouble = require('trouble')
keymap.set("n", "<leader>xx", function()
    trouble.toggle()
end, { desc = "Trouble Toggle" })
-- keymap.set("n", "<leader>xx", ":TroubleToggle<CR>", { desc = "Trouble Toggle" })
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
-- keymap.set("n", "<leader>xw", function() trouble.toggle().workspace_diagnostics() end, { desc = "Trouble Toggle in Workspace" })
keymap.set("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>",
    { desc = "Trouble Toggle in Document" })
-- keymap.set("n", "<leader>xd", function() trouble.toggle().mode().document_diagnostics() end, { desc = "Trouble Toggle in Document" })
keymap.set("n", "<leader>xl", ":TroubleToggle loclist<CR>",
    { desc = "Trouble Toggle Loclist" })
-- keymap.set("n", "<leader>xl", function() trouble.toggle().loclist() end, { desc = "Trouble Toggle Loclist" })
keymap.set("n", "<leader>xq", ":TroubleToggle quickfix<CR>",
    { desc = "Trouble Toggle Quickfix" })
-- keymap.set("n", "<leader>xq", function() trouble.toggle().quickfix() end, { desc = "Trouble Toggle Quickfix" })
keymap.set("n", "gR", ":TroubleToggle lsp_references<CR>",
    { desc = "Trouble Toggle LSP References" })
-- keymap.set("n", "gR", function() trouble.toggle().lsp_references() end, { desc = "Trouble Toggle LSP References" })
