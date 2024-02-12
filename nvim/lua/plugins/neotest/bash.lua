return {
    'rcasia/neotest-bash',
    dependencies = {
        "nvim-neotest/neotest",
    },
    lazy = true,
    ft = { "bash" },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-bash"),
            },
        })
    end,
}
