require('telescope').load_extension('aerial')

require('telescope').setup({
    extensions = {
        aerial = {
            -- Display symbols as <root>.<parent>.<symbol>
            show_nesting = {
                ['_'] = false, -- This key will be the default
                go = true,
                rust = true,
                c = true,
                json = true, -- You can set the option for specific filetypes
                yaml = true,
            }
        }
    }
})
