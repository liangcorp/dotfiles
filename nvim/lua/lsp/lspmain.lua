-- local border = {
-- 	{ "🭽", "FloatBorder" },
-- 	{ "▔", "FloatBorder" },
-- 	{ "🭾", "FloatBorder" },
-- 	{ "▕", "FloatBorder" },
-- 	{ "🭿", "FloatBorder" },
-- 	{ "▁", "FloatBorder" },
-- 	{ "🭼", "FloatBorder" },
-- 	{ "▏", "FloatBorder" },
-- }

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    -- border = border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    -- border = border,
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = true }]]

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
--     local hl = "DiagnosticSign" .. type
--     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics,
--     {
--       virtual_text = false,
--       signs = true,
--       update_in_insert = false,
--       underline = true,
--     }
-- )
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
