local prettier = require("prettier")

prettier.setup({
    bin = "prettierd", -- or `'prettierd'` (v0.22+)
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
