return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    -- ft = {
    --     "bash",
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
    --     "tex",
    -- },
    ft = {
        "git",
    },
    config = function()
        pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        require("config.autopair")
    end,
    lazy = true,
    -- keys = {
    --     { "<leader>th", "TSEnable highlight", { desc = '[T]reesitter [H]ightlight' } },
    --     { "<leader>te", "TSEnable indent", { desc = '[T]reesitter Ind[e]nt' } },
    -- }
}
