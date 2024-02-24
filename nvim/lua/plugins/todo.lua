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
        "c",
        "cpp",
        "go",
        "java",
        "javascript",
        "markdown",
        "python",
        "rust",
        "sh",
        "typescript",
        "zig",
    },
    lazy = true,
}
