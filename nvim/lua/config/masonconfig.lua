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
        -- "codelldb"
        -- "debugpy"
        -- "delve"
        "dockerls",
        "gopls",
        "groovyls",
        "jdtls",
        "jsonls",
        "ltex",
        "lua_ls",
        -- "markdownlint"
        "marksman",
        -- "prettier"
        "pylsp",
        "rust_analyzer",
        "tsserver",
        "yamlls",
    },
}
