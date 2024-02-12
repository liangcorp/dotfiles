return ({
    'nvim-neotest/neotest-jest',
    dependencies = {
        "nvim-neotest/neotest",
    },
    lazy = true,
    ft = { "javascript", "typescript" },
    -- keys = {
    --     { "<leader>tw", function() require('neotest').run.run({ jestCommand = 'jest --watch ' }) end, { desc = '[T]est [W]atch' } },
    -- },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-jest")({
                    jestCommand = "npm test --",
                    jestConfigFile = "custom.jest.config.ts",
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fn.getcwd()
                    end,
                }),
            },
        })
    end,
})
