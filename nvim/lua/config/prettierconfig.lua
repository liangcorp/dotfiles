local prettier = require("prettier")

prettier.setup({
    -- command = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/prettier"), -- or `'prettierd'` (v0.22+)
    bin = "prettier", -- or `'prettierd'` (v0.22+)
    filetypes = {
        "html",
        "css",
        "graphql",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
})
