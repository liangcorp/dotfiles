return {
    "nvim-neotest/neotest-go",
    dependencies = {
        "nvim-neotest/neotest",
    },
    lazy = true,
    ft = { "go" },
    -- keys = {
    --     { "<leader>tt", function()
    --         require("neotest").run.run()
    --     end, { desc = 'Run Nearest [T]est' } }
    -- },
    config = function()
        -- get neotest namespace (api call creates or returns namespace)
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                format = function(diagnostic)
                    local message =
                        diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)

        require("neotest").setup({
            adapters = {
                require("neotest-go"),
            },
        })
    end,
}