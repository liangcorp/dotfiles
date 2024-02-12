return {
    "folke/todo-comments.nvim",
    config = function()
        require("todo-comments").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        })
    end,
    ft = {
        "bash",
        "c",
        "cpp",
        "go",
        "javascript",
        "markdown",
        "pytyon",
        "rust",
        "typescript",
        "zig",
    },
    lazy = true,
}
