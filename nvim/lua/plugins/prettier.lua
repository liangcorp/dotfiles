return {
    "MunifTanjim/prettier.nvim",
    ft = { "markdown",
        "javascript",
        "typescript",
        "yaml",
        "yml",
        "html",
        "css",
        "json" },
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvimtools/none-ls.nvim",
    },
    -- keys = {
    --     '<space>p', function()
    --         require('prettier').format()
    --     end, { desc = '[P]rettier' }
    -- },
    lazy = true,
    config = function()
        require("null.none_ls")
        require("null.prettierconfig")
        require("keymaps.prettier")
    end,
}
