
local keymap = vim.keymap

-- Arial related shortcuts
local aerial = require('aerial')
keymap.set('n', '<leader>ae', function()
    aerial.toggle()
end, { desc = '[A]erial Toggle' })
