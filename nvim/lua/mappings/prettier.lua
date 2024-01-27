local keymap = vim.keymap

-- Prettier
local prettier = require('prettier')
keymap.set('n', '<space>p', function()
    prettier.format()
end, { desc = '[P]rettier' })

keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
