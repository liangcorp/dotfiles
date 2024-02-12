-- require('telescope').load_extension('aerial')
require("telescope").load_extension('harpoon')

require('telescope').setup({
    defaults = {
        layout_config = {
            vertical = { width = 0.5 }
            -- other layout configuration here
        },
        -- other defaults configuration here
    },
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
