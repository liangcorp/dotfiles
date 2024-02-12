return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-vim-test",
        "rouge8/neotest-rust",
        "nvim-neotest/neotest-go",
        "nvim-neotest/neotest-python",
        "lawrence-laz/neotest-zig",
        -- "haydenmeade/neotest-jest",
    },
    -- ft = { "zig", "rust", "python", "go" },
    lazy = true,
    keys = {
        { "<leader>tt", function()
            require("neotest").run.run()
        end, { desc = 'Run Nearest [T]est' } }
    },
    config = function()
        require("keymaps.neotest")
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                }),
                require("neotest-plenary"),
                require("neotest-rust"),
                require("neotest-zig"),
                require("neotest-go"),
                require("neotest-vim-test")({
                    ignore_file_types = { "python", "vim", "lua" },
                }),
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
    build = 'cargo install cargo-nextest --locked',
}
