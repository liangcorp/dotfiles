return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-vim-test",
        "antoinemadec/FixCursorHold.nvim",
    },
    lazy = true,
    -- keys = {
    --     { "<leader>tt", function()
    --         require("neotest").run.run()
    --     end, { desc = 'Run Nearest [T]est' } }
    -- },
    config = function()
        require("keymaps.neotest")

        require("neotest").setup({
            adapters = {
                require("neotest-plenary"),
                require("neotest-vim-test")({
                    ignore_file_types = { "python", "vim", "lua" },
                }),
                require("neotest-go"),  -- This doesn't support lazy load

            },
        })
    end,
}
