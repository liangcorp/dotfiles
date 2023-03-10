require('catppuccin').load()
require("catppuccin").setup({
    integrations = {
        aerial = true,
        gitsigns = true,
        cmp = true,
        mason = true,
        -- neogit = true,
        neotree = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        dap = {
            enabled = true,
            enable_ui = true,
        },
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
    }
})
