-- require('telescope').load_extension('aerial')
-- require("telescope").load_extension('harpoon')

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
        },
        fzf = {
            fuzzy = true,             -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    }
})
