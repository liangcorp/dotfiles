-- Telescope
return {
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    -- keys = {
    --     { '<leader>ff', "<cmd>Telescope find_files<cr>", desc = "Find file" },
    -- },
    -- config = function ()
    --     require("keymaps.telescope")
    --     require("navigation.telescopeconfig")
    -- end
}
