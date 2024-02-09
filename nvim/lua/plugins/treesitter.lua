return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    -- ft = {
    --     "c",
    --     "cpp",
    --     "rust",
    --     "go",
    --     "lua",
    --     "javascript",
    --     "typescript",
    --     "zig",
    --     "json",
    --     "yaml",
    --     "make",
    --     "markdown",
    -- },
    config = function()
        pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        require("config.treesitter")
    end,
    -- lazy = true,
    -- keys = {
    --     { "<leader>ts", "TSEnable highlight", { desc = '[T]ree[Sitter] Enable' } },
    -- }
}
