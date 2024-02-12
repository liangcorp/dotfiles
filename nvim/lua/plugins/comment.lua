return {
    "numToStr/Comment.nvim",
    ft = {
        "rust",
        "go",
        "bash",
        "lua",
        "c",
        "cpp",
        "javascript",
        "typescript",
        "java",
    },
    config = function()
        require("Comment").setup({})
    end,
    lazy = true,
}
