return {
    "MunifTanjim/prettier.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvimtools/none-ls.nvim",
    },
    config = function()
        require("null.none_ls")
        require("null.prettierconfig")
        require("keymaps.prettier")
    end,
    -- ft = {
    --     "markdown",
    --     "javascript",
    --     "typescript",
    --     "yaml",
    --     "yml",
    --     "html",
    --     "css",
    --     "json"
    -- },
    keys = {
        { '<space>p', function()
            require('prettier').format()
        end, { desc = '[P]rettier' }
        }
    },
    lazy = true,
}
