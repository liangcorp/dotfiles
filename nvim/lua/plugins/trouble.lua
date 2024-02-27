return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- ft = {
    --     "c",
    --     "cpp",
    --     "python",
    --     "go",
    --     "rust",
    --     "lua",
    --     "javascript",
    --     "typescript"
    -- },
    lazy = true,
    keys = {
        { "<leader>xx", function()
            require('trouble').toggle()
        end, { desc = "Trouble Toggle" } },

    },
    config = function()
        require('keymaps.trouble')
        require('navigation.trouble')
    end
}
