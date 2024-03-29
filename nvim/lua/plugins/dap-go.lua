return {
    "leoluz/nvim-dap-go",
    dependencies = {
        "folke/neodev.nvim",
        "mfussenegger/nvim-dap",
    },
    -- ft = { "go" },
    config = function()
        require("dap-go").setup({})
    end,
    lazy = true,
    keys = {
        { "<F9>", function()
            require("dap").toggle_breakpoint()
        end, { desc = 'Set Breakpoint' } }
    },
}
