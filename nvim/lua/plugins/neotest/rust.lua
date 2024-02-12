return {
    "rouge8/neotest-rust",
    dependencies = {
        "nvim-neotest/neotest",
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-vim-test",
    },
    lazy = true,
    ft = { "rust" },
    -- keys = {
    --     { "<leader>tt", function()
    --         require("neotest").run.run()
    --     end, { desc = 'Run Nearest [T]est' } }
    -- },
    config = function()
        require("neotest").setup({
            adapters = {
                -- require("neotest-plenary"),
                require("neotest-rust"),
            },
        })
    end,
    build = 'cargo install cargo-nextest --locked',
}
