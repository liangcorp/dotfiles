local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so' -- MacOS: This may be .dylib

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}
local cfg = require('rustaceanvim.config')

vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
    },
    -- LSP configuration
    server = {
        on_attach = function(_, bufnr)
            -- you can also put keymaps in here
            vim.keymap.set(
                "n",
                "<leader>a",
                function()
                    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
                    -- or vim.lsp.buf.codeAction() if you don't want grouping.
                end,
                { silent = true, buffer = bufnr }
            )
        end,
        settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
                cargo = {
                    autoReload = true,
                },
                checkOnSave = {
                    command = "clippy"
                },
                procMacro = {
                    ignored = {
                        leptos_macro = {
                            -- optional: --
                            -- "component",
                            "server",
                        },
                    },
                }
            },
        },
    },
    -- DAP configuration
    dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    capabilities = capabilities,
    flags = lsp_flags,
}
