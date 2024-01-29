return {
    "MunifTanjim/prettier.nvim",
    ft = { "markdown",
        "javascript",
        "typescript",
        "yaml",
        "json" },
    dependencies = {
        "neovim/nvim-lspconfig",
        -- 'jose-elias-alvarez/null-ls.nvim'
        "nvimtools/none-ls.nvim",
    },
    lazy = true,
    config = function()
        require("null.none_ls")
        require("null.prettierconfig")
        require("keymaps.prettier")
    end,
}
