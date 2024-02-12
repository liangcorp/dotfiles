return {
    "mfussenegger/nvim-dap",

    dependencies = {
        "nvim-telescope/telescope-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "jay-babu/mason-nvim-dap.nvim",
        "rcarriga/nvim-dap-ui",
        "folke/neodev.nvim",
    },

    -- ft = {
    --     "rust",
    --     "java",
    --     "c",
    --     "cpp",
    --     "go",
    --     "javascript",
    --     "typescript",
    --     "zig"
    -- },

    keys = {
        { "<F9>", function()
            require("dap").toggle_breakpoint()
        end, { desc = 'Set Breakpoint' } }
    },

    config = function()
        require("keymaps.debugger")
        require("dap.adapters")
        require("dap.config")
    end,
    lazy = true,
}
