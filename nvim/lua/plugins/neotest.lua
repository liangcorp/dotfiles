return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-vim-test",
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects",
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
                require("neotest-vim-test")({
                    ignore_file_types = { "python", "vim", "lua" },
                }),
                require("neotest-go"),
                -- Testing for javascript in the future
                -- require('neotest-jest')({
                --     jestCommand = "npm test --",
                --     jestConfigFile = "custom.jest.config.ts",
                --     env = { CI = true },
                --     cwd = function(path)
                --         return vim.fn.getcwd()
                --     end,
                -- }),
            },
        })
    end,
}
