require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        -- "dockerls",
        -- "gopls",
        "jsonls",
        -- "ltex",
        "ltex_plus",
        "lua_ls",
        "marksman",
        "pylsp",
        "rust_analyzer",
        -- "ts_ls",
        "yamlls",
        -- "zls",
    },
})

require("mason-tool-installer").setup({

    -- a list of all tools you want to ensure are installed upon
    -- start
    ensure_installed = {

        -- you can turn off/on auto_update per tool
        { "bash-language-server", auto_update = true },

        -- "delve",
        -- "groovyls",
        -- "jdtls",
        -- "flake8",
        -- "black",
        -- "isort",
        -- "stylua",
        -- "goimports",
        "markdownlint",
        -- "debugpy",
        "prettier",
        "prettierd",
        "jsonlint",
        "yamllint",
        "codespell",
        -- "golangcilint",
    },
})
