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
        -- "black",
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
        -- "mypy",
        -- "prettier"
        "pyright",
        -- "ruff",
        "rust_analyzer",
        "tsserver",
        "yamlls",
    },
}
