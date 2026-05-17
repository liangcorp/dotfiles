local keymap = vim.keymap
keymap.set("n", "<space>ls",
function()
vim.lsp.enable({'clangd', 'rust-analyzer', 'pylsp', 'jdtlsa', 'lua_ls', 'groovyls', 'jsonls', 'ts_ls'})
end
, { desc = "[L]SP [S]tart" })

keymap.set("n", "<space>lS", ":lsp disable<CR>", { desc = "[L]SP [S]top" })
