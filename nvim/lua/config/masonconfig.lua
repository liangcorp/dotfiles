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
        "bashls",
        "clangd",
        "dockerls",
        "gopls",
        "groovyls",
        "jdtls",
        "jsonls",
        "ltex",
        "lua_ls",
        "marksman",
        "pylsp",
        "rust_analyzer",
        "tsserver",
        "yamlls",
        "zls",
        -- "markdownlint",
        -- "debugpy",
        -- "prettier",
    },
}
