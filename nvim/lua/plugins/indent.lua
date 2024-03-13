return {
    "lukas-reineke/indent-blankline.nvim",
    -- dependencies = {
    --     "nvim-treesitter/nvim-treesitter",
    --     "nvim-treesitter/nvim-treesitter-textobjects",
    -- },
    main = "ibl",
    opts = {},
    ft = {
        "c",
        "cpp",
        "lua",
        "go",
        "java",
        "javascript",
        "python",
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
