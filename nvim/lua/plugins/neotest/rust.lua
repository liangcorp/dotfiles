return {
    "rouge8/neotest-rust",
    dependencies = {
        "nvim-neotest/neotest",
    },
    lazy = true,
    keys = {
        { "<leader>tr", function()
            require("neotest").run.run(vim.fn.expand('%'))
        end, { desc = '[T]est [R]ust' } }
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-rust"),
            },
        })
    end,
    build = 'cargo install cargo-nextest --locked',
}
