return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    ft = {
        "c",
        "cpp",
        "go",
        "rust",
        "tex",
        "markdown",
        "yaml",
        "json",
        "zig",
        "javascript",
        "typescript",
        "html",
        "css",
        "java",
        "lua",
        "groovy",
        "xml",
        "git",
    },
    config = function()
        pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        -- require("config.autopair")
        require("config.treesitter")
    end,
    lazy = true,
}
