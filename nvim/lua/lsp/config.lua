-- Useful mappings for all
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- require("lsp-format").on_attach(_)

    -- Disable LSP syntex highlight
    client.server_capabilities.semanticTokensProvider = nil

    --  automatic highlighting of references for the current text position
    -- if client.server_capabilities.documentHighlightProvider then
    --     vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    --     vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
    --     vim.api.nvim_create_autocmd("CursorHold", {
    --         callback = vim.lsp.buf.document_highlight,
    --         buffer = bufnr,
    --         group = "lsp_document_highlight",
    --         desc = "Document Highlight",
    --     })
    --     vim.api.nvim_create_autocmd("CursorMoved", {
    --         callback = vim.lsp.buf.clear_references,
    --         buffer = bufnr,
    --         group = "lsp_document_highlight",
    --         desc = "Clear All the References",
    --     })
    -- end


    -- Useful mappings for programming
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
    vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, bufopts)
    vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- rust
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    root_dir = util.root_pattern("Cargo.toml", ".git", "Cargo.lock"),
    -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                autoReload = true,
            },
            checkOnSave = {
                command = "clippy"
            },
            procMacro = {
                enable = true,
                ignored = {
                    leptos_macro = {
                        -- optional: --
                        -- "component",
                        "server",
                    },
                },
            },
        },
    },
}

-- local go_org_import = function(wait_ms)
--     local params = vim.lsp.util.make_range_params()
--     params.context = { only = { "source.organizeImports" } }
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
--     for cid, res in pairs(result or {}) do
--         for _, r in pairs(res.result or {}) do
--             if r.edit then
--                 local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
--                 vim.lsp.util.apply_workspace_edit(r.edit, enc)
--             end
--         end
--     end
-- end

-- golang
lspconfig.gopls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { 'gopls', 'serve' },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    single_file_support = true,
    -- for postfix snippets and analyzers
    capabilities = capabilities,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                fieldalignment = true,
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
}

-- python
lspconfig.pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    root_dir = util.root_pattern(".git"),
    filetypes = { "python" },
}

-- java
lspconfig.jdtls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    root_dir = util.root_pattern(".git, main.java"),
}

-- c and cpp
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    cmd = {
        "clangd",
        "--background-index",
        "--pretty",
        "--clang-tidy",
        "--completion-style=bundled",
        "--cross-file-rename",
        "--header-insertion=iwyu",
    },
    root_dir = util.root_pattern("Makefile", ".git"),
    filetypes = { "arduino", "c", "cpp" },
}

-- arduino
-- lspconfig.arduino_language_server.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     flags = lsp_flags,
--     cmd = {
--         "arduino-language-server",
--         "-cli-config", "$HOME/.arduino15/arduino-cli.yaml",
--         "-fqbn", "esp8266:esp8266:arduino-esp8266",
--         "-cli", "arduino-cli",
--         "-clangd", "clangd"
--     },
--     filetypes = { "arduino" },
-- }

-- groovy
lspconfig.groovyls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    cmd = { "java", "-jar",
        vim.fn.expand("$HOME/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar") },
}

-- javascript, json and zig
local servers = { 'zls', 'jsonls', 'tsserver' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
        root_dir = util.root_pattern(".git"),
    }
end

-- lua
lspconfig.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    capabilities = capabilities,
    flag = lsp_flags
}

-- markdown
lspconfig.ltex.setup {
    on_attach = on_attach,
    cmd = { "ltex-ls" },
    filetypes = { "markdown", "text", "latex", "tex", "txt", "org" },
    flags = lsp_flags,
}

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = "󱩎 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Manage the display of line diagnostic
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = true,
      signs = false,
      update_in_insert = false,
      underline = true,
    }
)

-- Formatting file
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd({ 'BufWritePre' }, {
--     pattern = '',
--     command = ":lua vim.lsp.buf.formatting()"
-- })

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250

-- local autocmd = vim.api.nvim_create_autocmd
--
-- autocmd({ 'CursorHold', 'CursorHoldI' }, {
--     pattern = '',
--     command = ":lua vim.diagnostic.open_float(nil, {focus=false})"
-- })
