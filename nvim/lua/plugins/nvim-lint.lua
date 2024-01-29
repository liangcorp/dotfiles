return {
    "mfussenegger/nvim-lint",
    ft = { "markdown" },
    config = function()
        require("lint").linters_by_ft = {
            markdown = { "markdownlint" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })

        vim.api.nvim_create_autocmd({ "InsertLeave" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
