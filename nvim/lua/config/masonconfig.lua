require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
    ensure_installed = {
        "clangd",
        "rust_analyzer",
        "gopls",
        "pyright",
        "clangd",
        "marksman",
        "ltex",
        "tsserver",
        "lua_ls",
        "jsonls",
        "groovyls",
        "dockerls",
        "bashls",
    },
}
