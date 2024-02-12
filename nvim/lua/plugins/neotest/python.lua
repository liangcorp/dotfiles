return {
    "nvim-neotest/neotest-python",
    dependencies = {
        "nvim-neotest/neotest",
    },
    lazy = true,
    ft = { "python" },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                }),
                require("neotest-plenary"),
            },
        })
    end,
}
