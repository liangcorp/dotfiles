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
-- vim.o.gfn = "Source Code Pro 13"
-- vim.o.spelllang = en_GB
-- vim.o.spell = true

vim.bo.tabstop = 4
vim.bo.softtabstop = 0
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.smartindent = true

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
require('neogit').setup()

-- LSP Configurations
-- Configurations with defaults
require("lsp-format").setup {}

require 'lspconfig'.clangd.setup { on_attach = require("lsp-format").on_attach }
require 'lspconfig'.yamlls.setup { on_attach = require("lsp-format").on_attach }
require 'lspconfig'.dockerls.setup { on_attach = require("lsp-format").on_attach }
require 'lspconfig'.marksman.setup { on_attach = require("lsp-format").on_attach }
require 'lspconfig'.tsserver.setup { on_attach = require("lsp-format").on_attach }
require 'lspconfig'.java_language_server.setup { on_attach = require("lsp-format").on_attach }
require 'lspconfig'.neocmake.setup { on_attach = require("lsp-format").on_attach }


-- Configurations with modifications
require("lsp/lspmain")
require("lsp/rust")
require("lsp/go")
-- require("lsp/vim-go")
require("lsp/python")
require("lsp/groovy")
require("lsp/completion")
require("lsp/grammar")
require("lsp/jsonls")
require("lsp/bash")
require("lsp/luaconfig") -- lua lsp

-- Markdown Preview
require("config/markdownpreview")

-- Markdown Linting
require("config/linter")

-- Keyboard mappings
require('config/mappings')

-- Directory Tree
require("config/tree")

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
require('config/lualineconfig')

-- Trouble window
require('config/trouble')

-- coc.nvim: an all in one coding tools
-- require('config/cocconfig')

-- Vim Test
require('config/vimtest')

-- Debugger nvim-dap
require("dap/dapconfig")
require("dap/dappython")
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'
require("dap/dapgo")
require("dap/dapcodellb")
require("dap/dapjavascript")

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
