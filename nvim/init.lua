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
    set gfn=Monospace\ 10
    set autowrite
    set encoding=UTF-8
    set completeopt=longest
    set ruler
    set wildmenu

    set spelllang=en_gb
    " set spell

    " colorscheme dracula
    colorscheme onedark
    " colorscheme tokyonight-storm

    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end

    " Remove trailing space
    autocmd BufWritePre * :%s/\s\+$//e

    autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
]])

vim.opt.number = true

-- Packer
local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
end)

require('plugins')

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
require 'lspconfig'.clangd.setup {}
require 'lspconfig'.yamlls.setup {}
require 'lspconfig'.dockerls.setup {}
-- require 'lspconfig'.marksman.setup {}
-- require 'lspconfig'.remark_ls.setup {}
require 'lspconfig'.tsserver.setup {}
require 'lspconfig'.java_language_server.setup {}
require 'lspconfig'.groovyls.setup {}

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
require("config/prettierconfig")

-- Status line using lualine
require('config/lualineconfig')

-- coc.nvim: an all in one coding tools
require('config/cocconfig')

-- Debugger nvim-dap
-- require("dapui").setup()
-- require("dap/dapconfig")
-- require("dap/daprust")

-- Debugging with vimspector
vim.cmd([[
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'delve' ]
]])
