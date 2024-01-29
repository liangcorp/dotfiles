return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- See `:help lualine.txt`
    -- opts = {
    --     options = {
    --         component_separators = '|',
    --         section_separators = '',
    --     },
    -- },
    config = function()
        require("lualine").setup({})
    end,
}
