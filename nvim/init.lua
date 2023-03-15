-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- vim.o.nocompatible = true
vim.o.autowrite = true
vim.o.mouse = "a"
vim.o.mousemodel = "popup"
vim.o.guioptions = "egmrti"
-- vim.o.completeopt = "longest"
vim.o.ruler = true
vim.o.wildmenu = true
vim.o.expandtab = true
-- vim.o.spelllang = en_GB
-- vim.o.spell = true
vim.scriptencoding = 'UTF-8'

-- highlight on search
-- vim.o.hlsearch = false

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.encoding = "UTF-8"
vim.opt.autoindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.number = true
vim.opt.path = vim.opt.path + '**'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespace on save
autocmd('BufWritePre', {
    pattern = '',
    command = ":%s/\\s\\+$//e"
})

require('plugins')

-- Themes
-- require("themes/catppuccin")
-- require("themes/nightfox")
-- require('onedark').load()
vim.cmd("colorscheme tokyonight-moon")

-- Toggle comments
-- "gcc" for line comment
-- "gbc" for block comment
require('Comment').setup()

-- local neogit = require('neogit')
-- neogit.setup {
--     use_magit_keybindings = true,
--     refresh_manually = true
-- }

require('gitsigns').setup()

vim.cmd("let g:github_enterprise_urls = ['https://github.ibm.com']")

-- LSP Configurations
-- Configurations with defaults
require 'lspconfig'.yamlls.setup {}
require 'lspconfig'.dockerls.setup {}
require 'lspconfig'.marksman.setup {}
require 'lspconfig'.neocmake.setup {}

-- Status line using lualine
require('lualine').setup {}

-- Configurations with modifications
require('luasnip').config.setup {}

-- TODOs highlight
require("todo-comments").setup {}

-- Display horizontal lines for indentations
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

-- nvim-tree empty setup using defaults
require("nvim-tree").setup()

-- LSP configurations
require("lsp/lspmain")
require("lsp/completion")
require("lsp/bash")

-- Markdown Preview
require("config/markdownpreview")

-- Markdown Linting
require("config/linter")

-- Keyboard mappings
require('config/mappings')

-- Treesitter for better highlighting
require("config/treesitter")

-- Aerial for indexing/traversing definitions
require("config/aerialline")

-- Mason Installer for LSP servers
require("config/masonconfig")

-- Telescope for fuzzy finding
require("config/telescopeconfig")

-- Prettier for better code formatting
require("config/prettierconfig")

-- Trouble window
require('config/trouble')

-- Neotest
require("config/neotest")

-- Debugger nvim-dap
require("dap/dapconfig")

-- DAP for c/cpp/rust
require("dap/dapcodellb")

-- DAP for javascript and typescript
require("dap/dapjavascript")

-- DAP for python
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'

-- DAP for golang
require('dap-go').setup {}

