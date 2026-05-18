local keymap = vim.keymap

keymap.set("n", "<space>ls",
    function()
        vim.lsp.enable({
            'clangd',
            'rust-analyzer',
            'python-language-server',
            'java-language-server',
            'lua-language-server',
            'groovy-language-server',
            'vscode-json-language-server',
            'gopls',
            'typescript-language-server',
            'bash-language-server',
            'yaml-language-server'
        })
    end
    , { desc = "[L]SP [S]tart" })

keymap.set("n", "<space>lS", ":lsp disable<CR>", { desc = "[L]SP [S]top" })

-- keymap.set('n', '<leader>ls', function()
--     vim.diagnostic.enable(not vim.diagnostic.is_enabled())
-- end, { desc = 'Toggle LSP diagnostics globally' })

local opts = { noremap = true, silent = true }
keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
keymap.set('n', 'K', vim.lsp.buf.hover, opts)

-- Useful mappings for programming
-- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap = true, silent = true }
keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
-- keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
keymap.set('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, bufopts)
keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, bufopts)
keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
