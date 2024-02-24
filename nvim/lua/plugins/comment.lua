return {
    "numToStr/Comment.nvim",
    ft = {
        "c",
        "cpp",
        "go",
        "lua",
        "java",
        "javascript",
        "python",
        "rust",
        "sh",
        "typescript",
        "zig",
    },
    config = function()
        require("Comment").setup({})
    end,
    lazy = true,
}
