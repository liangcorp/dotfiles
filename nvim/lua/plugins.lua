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
    'ThePrimeagen/harpoon',

    -- Themes
    "navarasu/onedark.nvim",

    -- Arie (list and move between functions
    "stevearc/aerial.nvim",

    -- Illuminate same words
    require("plugins.illuminate"),

    -- Telescope
    require("plugins.telescope"),

    -- Noice to modify neovim command prompt
    require("plugins.noice"),

    -- Indent Blanline
    require("plugins.indent"),

    -- Treesitter
    require("plugins.treesitter"),

    -- Nvim-tree
    require("plugins.nvim-tree"),

    -- Lualine status line
    require("plugins.lualine"),

    -- NVIM Lint
    require("plugins.nvim-lint"),

    -- NVIM Java
    require("plugins.nvim-java"),

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

    -- Show TODO in highlight
    require("plugins.todo"),

    -- Prettier
    require("plugins.prettier"),

    -- Git related
    require("plugins.git"),

    -- Toggle comments
    require("plugins.comment"),

    -- Neotest
    require("plugins.neotest"),

    -- Markdown preview
    -- install without yarn or npm
    require("plugins.markdown-preview"),

    -- Create pairing brackets and quotation marks
    require("plugins.autopairs"),

    -- Debugger
    require("plugins.debugger"),

    require("plugins.dap-go"),

    require("plugins.dap-python"),

    require("plugins.dap-js"),

    -- {
    --     "microsoft/vscode-js-debug",
    --     -- After install, build it and rename the dist directory to out
    --     build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
    --     version = "1.*",
    -- },
})
