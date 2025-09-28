root_dir = util.root_pattern("Cargo.toml", ".git", "Cargo.lock"),
-- Server-specific settings. See `:help lspconfig-setup`
settings = {
    ['rust-analyzer'] = {
        cargo = {
            autoReload = true,
            allFeatures = true,
        },
        checkOnSave = {
            command = "clippy"
        },
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
        rustfmt = {
            overrideCommand = "leptosfmt --stdin --rustfmt"
        },
        diagnostics = {
            disabled = {
                "unlinked-file",
            },
        },
    },
},
