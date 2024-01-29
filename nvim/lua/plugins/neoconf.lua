return {
    "folke/neoconf.nvim",

    config = function()
        -- Neoconf differentiate between local and global project setting
        require("neoconf").setup({
            -- override any of the default settings here
        })
    end,
}
