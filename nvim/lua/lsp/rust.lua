local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so' -- MacOS: This may be .dylib

local rt = require("rust-tools")

rt.setup({
    capabilities = capabilities,
    server = {
        settings = {
            ['rust-analyzer'] = {
                cargo = {
                    autoReload = true,
                },
                checkOnSave = {
                    command = "clippy"
                }
            }
        },
        on_attach = function(_, bufnr)
            require("lsp-format").on_attach(_)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    },
    flags = lsp_flags,
})


-- require 'lspconfig'.rust_analyzer.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     settings = {
--         ["rust-analyzer"] = {
--             assist = {
--                 importMergeBehavior = "last",
--                 importPrefix = "by_self",
--             },
--             diagnostics = {
--                 disabled = { "unresolved-import" }
--             },
--             cargo = {
--                 loadOutDirsFromCheck = true
--             },
--             procMacro = {
--                 enable = true
--             },
--             checkOnSave = {
--                 command = "clippy"
--             },
--         }
--     },
--     flags = lsp_flags,
-- }
