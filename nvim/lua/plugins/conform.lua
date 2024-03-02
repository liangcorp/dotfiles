return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
                -- Use a sub-list to run only the first available formatter
                javascript = { { "prettierd", "prettier" } },
                typescript = { { "prettierd", "prettier" } },
                markdown = { { "prettierd", "prettier" } },
                yaml = { { "prettierd", "prettier" } },
                json = { { "prettierd", "prettier" } },
                go = { { "gofmt" } },
                rust = { { "rustfmt" } },
            },
        })
    end,
    keys = {
        { '<space>p', function ()
           require("conform").format()
        end, desc = "Conform [P]rettier" },
    },
}