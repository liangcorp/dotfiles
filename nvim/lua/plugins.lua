local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Harpoon
    -- require("plugins.harpoon"),

    {
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup {
                style = 'warmer',
                -- style = 'darker',
                highlights = {
                    ["Operator"] = { fg = '#a7aab0' },
                }
            }
            require('onedark').load()
        end
    },

    -- Arie (list and move between functions
    require("plugins.aerial"),

    -- {
    --     -- Zig
    --     'ziglang/zig.vim',
    --     ft = { "zig" },
    --     lazy = true,
    -- },

    -- Telescope
    require("plugins.telescope"),
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        lazy = true
    },

    -- Indent Blankline
    require("plugins.indent"),

    -- Treesitter
    require("plugins.treesitter"),

    -- NVIM Lint
    require("plugins.nvim-lint"),

    -- NVIM Java
    -- require("plugins.nvim-java"),

    -- This is a VS Code like winbar
    require("plugins.barbecue"),

    -- LSP server installer and manager
    require("plugins.nvim-lspconfig"),

    -- Neovim plugin to manage global and project-local settings.
    require("plugins.neoconf"),

    -- Text and code completions
    require("plugins.cmp"),

    -- Show Error in Trouble Window
    require("plugins.trouble"),

    -- Prettier
    require("plugins.conform"),

    -- Git related
    "lewis6991/gitsigns.nvim",
    require("plugins.git"),

    -- Toggle comments
    require("plugins.comment"),

    -- Neotest
    require("plugins.vim-test"),
    -- require("plugins.neotest"),
    -- require("plugins.neotest.bash"),
    -- require("plugins.neotest.rust"),
    -- require("plugins.neotest.golang"),
    -- require("plugins.neotest.python"),
    -- require("plugins.neotest.zig"),

    -- Markdown preview
    -- install without yarn or npm
    require("plugins.markdown-preview"),

    -- Create pairing brackets and quotation marks
    -- require("plugins.autopairs"),

    -- Debugger
    require("plugins.debugger"),

    require("plugins.dap-go"),

    require("plugins.dap-python"),

    -- require("plugins.dap-js"),
})
