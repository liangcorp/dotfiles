return {
    "mfussenegger/nvim-dap-python",
    dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    ft = { "python" },
    config = function()
        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)
        require("dap-python").test_runner = "pytest"
    end,
    lazy = true,
    keys = {
        { "<leader>pt", function()
            require('dap-python').test_method()
        end, { desc = "Debug [P]ythong [T]est" } },

        { "<leader>pc", function()
            require('dap-python').test_class()
        end, { desc = "Debug [P]ythong [C]lass" } },

        { "<leader>ps", function()
            require('dap-python').debug_selection({
                noremap = true,
                silent = true
            })
        end, { desc = "Debug [P]ythong [S]election" } },

    }
}
