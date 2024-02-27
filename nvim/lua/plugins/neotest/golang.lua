return {
    "nvim-neotest/neotest-go",
    dependencies = {
        "nvim-neotest/neotest",
    },
    lazy = true,
    keys = {
        { "<leader>tg", function()
            require("neotest").run.run(vim.fn.expand('%'))
        end, { desc = '[T]est [G]o' } }
    },
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

        require("neotest-go")
    end,
}
