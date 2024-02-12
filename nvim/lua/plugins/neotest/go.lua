return {
    "nvim-neotest/neotest-go",
    dependencies = {
        "nvim-neotest/neotest",
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-vim-test",
    },
    lazy = true,
    -- ft = { "go" },
    keys = {
        { "<leader>tt", function()
            require("neotest").run.run()
        end, { desc = 'Run Nearest [T]est' } }
    },
    config = function()
        require("keymaps.neotest")
        require("neotest").setup({
            adapters = {
                require("neotest-plenary"),
                require("neotest-go"),
            },
        })
    end,
}
