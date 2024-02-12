return {
    "nvim-neotest/neotest-python",
    dependencies = {
        "nvim-neotest/neotest",
        "nvim-neotest/neotest-plenary",
    },
    lazy = true,
    ft = { "python" },
    config = function()
        require("keymaps.neotest")
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
