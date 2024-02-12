return {
    "nvim-neotest/neotest-python",
    dependencies = {
        "nvim-neotest/neotest",
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-vim-test",
    },
    lazy = true,
    ft = { "python" },
    -- keys = {
    --     { "<leader>tt", function()
    --         require("neotest").run.run()
    --     end, { desc = 'Run Nearest [T]est' } }
    -- },
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
