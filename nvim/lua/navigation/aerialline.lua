require('aerial').setup({
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        local aerial = require('aerial')
        vim.keymap.set('n', '{', function() aerial.prev() end, { buffer = bufnr })
        vim.keymap.set('n', '}', function() aerial.next() end, { buffer = bufnr })
        vim.keymap.set('n', '<leader>fa', function() require('telescope').extensions.aerial.aerial() end,
            { buffer = bufnr }
        )
    end
})
