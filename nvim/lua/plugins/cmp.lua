return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",

        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        -- "petertriho/cmp-git",

        -- Snippets
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },

    event = { "InsertEnter", "CmdlineEnter" },
    keys = {
        {
            '<space>ce',
            function()
                require('cmp').setup.buffer { enabled = true }
            end,
            desc = "[C]ompletion [E]nable"
        },
        {
            '<space>cd',
            function()
                require('cmp').setup.buffer { enabled = false }
            end,
            desc = "[C]ompletion [D]isable"
        },
    },
    config = function()
        require("luasnip").setup({})
    end,
    lazy = true,
}
