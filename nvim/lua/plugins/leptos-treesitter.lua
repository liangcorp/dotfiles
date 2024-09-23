return {
    "rayliwell/tree-sitter-rstml",
    dependencies = { "nvim-treesitter" },
    -- ft = {
    --     "rust",
    -- },
    build = ":TSUpdate",
    config = function()
        require("tree-sitter-rstml").setup()
    end,
    Lazy = true,
}
