return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "stevearc/aerial.nvim",
        "folke/neoconf.nvim",
        "hrsh7th/nvim-cmp",
        "lukas-reineke/indent-blankline.nvim",
    },
    cmd = {
        "LspStart"
    },
    -- ft = {
    --     "rust",
    --     "c",
    --     "cpp",
    --     "lua",
    --     "go",
    --     "javascript",
    --     "typescript",
    --     "sh",
    --     "zig",
    -- },
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.yamlls.setup {}
        lspconfig.dockerls.setup {}
        lspconfig.marksman.setup {}
        -- lspconfig.neocmake.setup {}
        require("config.masonconfig")
        require('lsp.config')
        require('lsp.completion')
        require('lsp.bash')
        require('keymaps.aerial')
        require('navigation.aerialline')
        require('telescope').load_extension('aerial')
    end,
    keys = {
        { '<space>ls', ":LspStart<CR>", desc = "[L]SP [S]tart" },
    },
    lazy = true,
}
