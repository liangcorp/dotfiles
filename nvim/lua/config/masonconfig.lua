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
        "marksman",
        "ltex",
        "tsserver",
        "lua_ls",
        "jsonls",
        "dockerls",
        "bashls",
        "jdtls",
        "groovyls",
        "yamlls",
        "jdtls",
        "pyright",
    },
}
