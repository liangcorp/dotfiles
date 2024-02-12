return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    ft = {
        "rust",
        "go",
        "c",
        "cpp",
        "lua",
        "javascript",
        "typescript",
        "bash"
    },
    config = function()
        require("ibl").setup()
    end,
    lazy = true,
}
