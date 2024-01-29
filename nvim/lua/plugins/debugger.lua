return {
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "rcarriga/nvim-dap-ui",

    dependencies = {
        "folke/neodev.nvim",
        "mfussenegger/nvim-dap",
    },

    ft = { "rust",
        "java",
        "c",
        "cpp",
        "javascript",
        "typescript",
        "zig" },

    config = function()
        require("dapui").setup()
        require("config.neodev")
    end,
}
