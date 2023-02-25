-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd([[
    syntax on
    filetype plugin indent on
    set tabstop=4
    set nocompatible
    set softtabstop=0
    set shiftwidth=4
    set expandtab
    set path+=**
    set mouse=a
    set mousemodel=popup
    set guioptions=egmrti
    " set gfn=Monospace\ 10
    set autowrite
    set encoding=UTF-8
    set completeopt=longest
    set ruler
    set wildmenu

    " set spelllang=en_gb
    " set spell

    " colorscheme dracula
    " colorscheme onedark
    " colorscheme tokyonight-storm

    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end

    " Remove trailing space
    autocmd BufWritePre * :%s/\s\+$//e
]])

vim.opt.number = true

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
require("nvim-dap-virtual-text").setup {}
require("dap/dappython")
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'
require("dap/dapgo")
require("dap/dapjavascript")

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
