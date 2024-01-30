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
opt.relativenumber = true
opt.path = vim.opt.path + '**'

-- Disable search highlight
-- opt.hlsearch = false

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
require('themes/onedark')

vim.cmd("let g:github_enterprise_urls = ['https://github.ibm.com']")

-- Neodev
require('config/neodev')

-- Mason Installer for LSP servers
-- require('config/masonconfig')

-- Neotest
-- require('config/neotest')

-- Treesitter for better highlighting
-- require('config/treesitter')

-- LSP Configurations
-- Configurations with defaults
-- require 'lspconfig'.yamlls.setup {}
-- require 'lspconfig'.dockerls.setup {}
-- require 'lspconfig'.marksman.setup {}
-- require 'lspconfig'.neocmake.setup {}

-- Configurations with modifications

-- LSP configurations
require('lsp/config')
require('lsp/completion')
require('lsp/bash')

-- Keyboard keymaps
require('keymaps/aerial')
require('keymaps/basic')
require('keymaps/debugger')
-- require('keymaps/neotest')
-- require('keymaps/prettier')
require('keymaps/telescope')
-- require('keymaps/trouble')
require('keymaps/harpoon')

-- Prettier for better code formatting
-- require('null/none_ls')
-- require('null/prettierconfig')

-- Markdown Preview
require('null/markdownpreview')

-- Aerial for indexing/traversing definitions
require('navigation/aerialline')

-- Telescope for fuzzy finding
require('navigation/telescopeconfig')

-- Trouble window
-- require('navigation/trouble')
require('navigation/diagnostics')

-- Debugger nvim-dap
require('dap/config')

-- DAP for c/cpp/rust
require('dap/adapters')

-- DAP for javascript and typescript
-- require('dap/javascript')
