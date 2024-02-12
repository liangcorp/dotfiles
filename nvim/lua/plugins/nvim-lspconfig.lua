return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    ft = {
        "rust",
        "c",
        "cpp",
        "lua",
        "go",
        "javascript",
        "typescript",
        "sh",
    },
    config = function()
        require 'lspconfig'.yamlls.setup {}
        require 'lspconfig'.dockerls.setup {}
        require 'lspconfig'.marksman.setup {}
        require 'lspconfig'.neocmake.setup {}
        require("config.masonconfig")
        require('lsp.config')
        require('lsp.completion')
        require('lsp.bash')
        require('keymaps.aerial')
        require('navigation.aerialline')
        require('telescope').load_extension('aerial')
    end,
    lazy = true,
}
