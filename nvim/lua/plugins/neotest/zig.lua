return {
    "lawrence-laz/neotest-zig",
    dependencies = {
        "nvim-neotest/neotest",
        "nvim-neotest/neotest-plenary",
    },
    lazy = true,
    ft = { "zig" },
    keys = {
        { "<leader>tt", function()
            require("neotest").run.run()
        end, { desc = 'Run Nearest [T]est' } }
    },
    config = function()
        require("keymaps.neotest")
        require("neotest").setup({
            adapters = {
                require("neotest-zig"),
            },
        })
    end,
}
