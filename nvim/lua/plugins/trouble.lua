return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ft = { "c",
        "cpp",
        "python",
        "go",
        "rust",
        "javascript",
        "typescript" },
    lazy = true,
    config = function()
        require('keymaps.trouble')
        require('navigation.trouble')
    end
}
