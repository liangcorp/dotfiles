local keymap = vim.keymap

-- Harpoon
-- Marks
keymap.set("n", "<leader>hm", function()
    require('harpoon.mark').add_file()
end, { desc = "Harpoon Mark" })


-- File Navigation
keymap.set("n", "<leader>ht", function()
    require('harpoon.ui').toggle_quick_menu()
end, { desc = "Harpoon Quick Menu Toggle" })


keymap.set("n", "<leader>hn", function()
    require('harpoon.ui').nav_next()
end, { desc = "Harpoon Next" })

keymap.set("n", "<leader>hp", function()
    require('harpoon.ui').nav_prev()
end, { desc = "Harpoon Previous" })
