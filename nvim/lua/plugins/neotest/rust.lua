return {
    "rouge8/neotest-rust",
    dependencies = {
        "nvim-neotest/neotest",
        "nvim-neotest/neotest-plenary",
    },
    lazy = true,
    ft = { "rust" },
    config = function()
        require("keymaps.neotest")
        require("neotest").setup({
            adapters = {
                require("neotest-plenary"),
                require("neotest-rust"),
            },
        })
    end,
    build = 'cargo install cargo-nextest --locked',
}
