return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/neotest-plenary",
        "antoinemadec/FixCursorHold.nvim",
    },
    lazy = true,
    config = function()
        require("keymaps.neotest")

        require("neotest").setup({
            adapters = {
                require("neotest-plenary"),
                require("neotest-go"),  -- This doesn't support lazy load
            },
        })
    end,
}
