return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    ft = {
        "c",
        "cpp",
        "lua",
        "go",
        "java",
        "javascript",
        "rust",
        "sh",
        "typescript",
        "zig",
    },
    config = function()
        require("ibl").setup()
    end,
    lazy = true,
}
