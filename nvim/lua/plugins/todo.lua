return {
    "folke/todo-comments.nvim",
    config = function()
        require("todo-comments").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        })
        require("keymaps.todo")
    end,
    ft = {
        "c",
        "cpp",
        "markdown",
        "rust",
        "javascript",
        "typescript",
        "go",
        "sh",
        "python",
        "java",
    },
    lazy = true,
    keys = {
        {
            "]t", function()
            require("todo-comments").jump_next()
        end, { desc = "Next todo comment" }
        },

        {
            "[t", function()
            require("todo-comments").jump_prev()
        end, { desc = "Previous todo comment" }
        },
    }
}
