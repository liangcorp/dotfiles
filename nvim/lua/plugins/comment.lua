return {
    "numToStr/Comment.nvim",
    ft = {
        "c",
        "cpp",
        "go",
        "lua",
        "java",
        "javascript",
        "rust",
        "sh",
        "typescript",
    },
    config = function()
        require("Comment").setup({})
    end,
    lazy = true,
}
