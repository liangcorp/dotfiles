return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    ft = { "rust",
        "go",
        "c",
        "cpp",
        "javascript",
        "typescript" },
    config = function()
        require("ibl").setup()
    end,
    lazy = true,
}
