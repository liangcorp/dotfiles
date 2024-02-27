local keymap = vim.keymap

-- Prettier
local prettier = require('prettier')
keymap.set('n', '<space>p', function()
    prettier.format()
end, { desc = '[P]rettier' })
