return {
    'ThePrimeagen/harpoon',
    lazy = true,
    keys = {
        { "<leader>ht", function() require('harpoon.ui').toggle_quick_menu() end, { desc = "Harpoon Quick Menu Toggle" } },
    },

    config = function()
        require("keymaps.harpoon")
    end
}
