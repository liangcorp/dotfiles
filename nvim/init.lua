-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local o = vim.o
o.nocompatible = true
o.autowrite = true
o.mouse = 'a'
o.mousemodel = 'popup'
o.guioptions = 'egmrti'
-- vim.o.completeopt = "longest"
o.ruler = true
o.wildmenu = true
o.expandtab = true
-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'
-- vim.o.spelllang = en_GB
-- vim.o.spell = true
vim.scriptencoding = 'UTF-8'

local opt = vim.opt
-- set termguicolors to enable highlight groups
opt.termguicolors = true
opt.tabstop = 4
opt.softtabstop = 0
opt.shiftwidth = 4
opt.smartindent = true
opt.encoding = 'UTF-8'
-- vim.opt.autoindent = true
opt.showcmd = true
opt.cmdheight = 1
-- vim.opt.ignorecase = true
opt.smarttab = true
-- vim.opt.breakindent = true
opt.number = true
opt.path = vim.opt.path + '**'

-- Disable search highlight
opt.hlsearch = false

opt.cursorline = true

-- set termguicolors to enable highlight groups
opt.termguicolors = true

local autocmd = vim.api.nvim_create_autocmd

vim.g.loaded_perl_provider = 0

-- Remove whitespace on save
autocmd('BufWritePre', {
    pattern = '',
    command = ":%s/\\s\\+$//e"
})

require('plugins')

-- Themes
-- require('themes/catppuccin')
-- require("themes/onedark")
-- vim.cmd("colorscheme catppuccin-macchiato")
-- vim.cmd("colorscheme tokyonight-moon")
vim.cmd("colorscheme onedark")

require("ibl").setup()

-- nvim-tree
require("nvim-tree").setup({
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

-- Lua line
require('lualine').setup {}

-- local neogit = require('neogit')
-- neogit.setup {
--     use_magit_keybindings = true,
--     refresh_manually = true
-- }

vim.cmd("let g:github_enterprise_urls = ['https://github.ibm.com']")

-- Neodev
require('config/neodev')

-- Mason Installer for LSP servers
require('config/masonconfig')

-- Neotest
require('config/neotest')

-- Treesitter for better highlighting
require('config/treesitter')

-- Neoconf differentiate between local and global project setting
require("neoconf").setup({
  -- override any of the default settings here
})

-- LSP Configurations
-- Configurations with defaults
require 'lspconfig'.yamlls.setup {}
require 'lspconfig'.dockerls.setup {}
require 'lspconfig'.marksman.setup {}
require 'lspconfig'.neocmake.setup {}

-- Configurations with modifications
-- require('luasnip').config.setup {}

-- LSP configurations
require('lsp/config')
require('lsp/completion')
require('lsp/bash')

-- Keyboard mappings
require('mappings/aerial')
require('mappings/basic')
require('mappings/debugger')
require('mappings/neotest')
require('mappings/nvimtree')
require('mappings/prettier')
require('mappings/telescope')
require('mappings/trouble')
require('mappings/harpoon')

-- Prettier for better code formatting
require('null/none_ls')
require('null/prettierconfig')

-- Markdown Preview
require('null/markdownpreview')

-- Markdown Linter
require('null/markdownlint')

-- Aerial for indexing/traversing definitions
require('navigation/aerialline')

-- Telescope for fuzzy finding
require('navigation/telescopeconfig')

-- Trouble window
require('navigation/trouble')
require('navigation/diagnostics')

-- Debugger nvim-dap
require('dap/config')
require("dapui").setup()

-- DAP for c/cpp/rust
require('dap/adapters')

-- DAP for javascript and typescript
require('dap/javascript')

-- DAP for python
require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
require('dap-python').test_runner = 'pytest'

-- DAP for golang
require('dap-go').setup {}
