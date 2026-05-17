return {
    cmd = { "rust-analyzer" },
    -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                autoReload = true,
                allFeatures = true,
            },
            checkOnSave = true,
            procMacro = {
                enable = true,
                ignored = {
                    leptos_macro = {
                        -- optional:
                        -- "component",
                        -- "server",
                    },
                },
            },
            diagnostics = {
                disabled = {
                    "unlinked-file",
                },
            },
        },
    },
    filetypes = { "rust" }
}
