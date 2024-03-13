return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                -- Conform will run multiple formatters sequentially
                -- Use a sub-list to run only the first available formatter
                html = { { "prettierd", "prettier" } },
                css = { { "prettierd", "prettier" } },
                javascript = { { "prettierd", "prettier" } },
                typescript = { { "prettierd", "prettier" } },
                markdown = { { "prettierd", "prettier" } },
                yaml = { { "prettierd", "prettier" } },
                json = { { "prettierd", "prettier" } },
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
