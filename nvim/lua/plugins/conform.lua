return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                -- Conform will run multiple formatters sequentially
                go = { "goimports", "gofmt" },
                -- You can also customize some of the format options for the filetype
                rust = { "rustfmt", lsp_format = "fallback" },
                -- Use a sub-list to run only the first available formatter
                html = { "prettierd", "prettier", stop_after_first = true },
                css = { "prettierd", "prettier", stop_after_first = true },
                scss = { "prettierd", "prettier", stop_after_first = true },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                markdown = { "prettierd", "prettier", stop_after_first = true },
                yaml = { "prettierd", "prettier", stop_after_first = true },
                json = { "prettierd", "prettier", stop_after_first = true },
            },
        })
    end,
    keys = {
        {
            '<space>p',
            function()
                require("conform").format()
            end,
            desc = "Conform [P]rettier"
        },
    },
}
