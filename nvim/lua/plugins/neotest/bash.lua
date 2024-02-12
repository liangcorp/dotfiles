return {
    'rcasia/neotest-bash',
    dependencies = {
        "nvim-neotest/neotest",
    },
    lazy = true,
    ft = { "sh" },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-bash"),
            },
        })
    end,
}
