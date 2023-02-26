-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.o.nocompatible = true
vim.o.autowrite = true
vim.o.encoding = "UTF-8"
vim.o.mouse = "a"
vim.o.mousemodel = "popup"
vim.o.guioptions = "egmrti"
vim.o.completeopt = "longest"
vim.o.ruler = true
vim.o.wildmenu = true
vim.opt.path = vim.opt.path + '**'
-- vim.o.gfn = "Source Code Pro Regular 13"
-- vim.o.spelllang = en_GB
-- vim.o.spell = true

vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.opt.number = true

local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespace on save
autocmd('BufWritePre', {
    pattern = '',
    command = ":%s/\\s\\+$//e"
})

-- Packer
local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
end)

require('plugins')

require('onedark').load()

-- Toggle comments
-- "gcc" for line comment
-- "gbc" for block comment
require('Comment').setup()

-- Git signs
require('gitsigns').setup()

-- Magit for neovim
-- require('neogit').setup()

-- LSP Configurations
-- Configurations with defaults
-- require("lsp-format").setup {}

-- require 'lspconfig'.yamlls.setup { on_attach = require("lsp-format").on_attach }
-- require 'lspconfig'.dockerls.setup { on_attach = require("lsp-format").on_attach }
-- require 'lspconfig'.marksman.setup { on_attach = require("lsp-format").on_attach }
-- require 'lspconfig'.neocmake.setup { on_attach = require("lsp-format").on_attach }

require 'lspconfig'.yamlls.setup {}
require 'lspconfig'.dockerls.setup {}
require 'lspconfig'.marksman.setup {}
require 'lspconfig'.neocmake.setup {}

-- Configurations with modifications
require("lsp/lspmain")
require("lsp/completion")
require("lsp/grammar")
require("lsp/bash")

-- Markdown Preview
require("config/markdownpreview")

-- Markdown Linting
require("config/linter")

-- Keyboard mappings
require('config/mappings')

-- Directory Tree
require("nvim-tree").setup()

-- Treesitter for better highlighting
require("config/treesitter")

-- Aerial for indexing/traversing definitions
require("config/aerialline")

-- Mason Installer for LSP servers
require("config/masonconfig")

-- Telescope for fuzzy finding
require("config/telescopeconfig")

-- Prettier for better code formatting
require("config/nullls")
require("config/prettierconfig")

-- Status line using lualine
require('lualine').setup {}

-- Trouble window
require('config/trouble')

-- VIM Test strategy
vim.cmd([[
    let test#strategy = "neovim"
]])

-- Display horizontal lines for indentations
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

-- Debugger nvim-dap
require("dap/dapconfig")

-- DAP for python
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'

-- DAP for c/cpp/rust
require("dap/dapcodellb")

-- DAP for javascript and typescript
require("dap/dapjavascript")

-- DAP for golang
require('dap-go').setup {}
