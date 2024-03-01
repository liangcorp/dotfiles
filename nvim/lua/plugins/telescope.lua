-- Telescope
return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        'nvim-telescope/telescope-fzf-native.nvim',
    },
    lazy = true,
    keys = {
        { '<leader>ff', "<cmd>Telescope find_files<CR>", { desc = "Find file" } },
        { '<leader>fb', "<cmd>Telescope buffers<CR>",    { desc = '[F]ind by [B]uffer' } },
    },
    config = function()
        require("keymaps.telescope")
        require("navigation.telescopeconfig")
    end
}
