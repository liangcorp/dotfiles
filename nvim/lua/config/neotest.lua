require("neotest").setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
        }),
        require("neotest-plenary"),
        require("neotest-rust"),
        require("neotest-zig"),
        require("neotest-go"),

        -- require("neotest-vim-test")({
        --     ignore_file_types = { "python", "vim", "lua" },
        -- }),
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
