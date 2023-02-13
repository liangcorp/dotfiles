require("mason-lspconfig").setup {
    ensure_installed = { "rust_analyzer", "clangd", "gopls", "tsserver", "pyright" },
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
