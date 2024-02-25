return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        -- require("config.autopair")
        require("config.treesitter")
    end,
}
