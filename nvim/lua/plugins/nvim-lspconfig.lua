return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    ft = {},
    config = function()
        require 'lspconfig'.yamlls.setup {}
        require 'lspconfig'.dockerls.setup {}
        require 'lspconfig'.marksman.setup {}
        require 'lspconfig'.neocmake.setup {}
        require("config.masonconfig")
    end,
    lazy = true,
}