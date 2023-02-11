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

-- Keyboard mappings
require('mappings')

-- Toggle comments
-- "gcc" for line comment
-- "gbc" for block comment
require('Comment').setup()

-- Git signs
require('gitsigns').setup()

-- Treesitter
require("nvim-tree").setup()
require("tree")

-- Magit for neovim
local neogit = require('neogit')
neogit.setup {}

-- Mason Installer
require("masonconfig")
require("mason-lspconfig").setup {
    ensure_installed = { "sumneko_lua", "rust_analyzer", "clangd", "dockerls", "tsserver", "gopls", "groovyls", "jsonls" },
}

-- LSP Configurations
-- require 'lspconfig'.pyright.setup {}
-- require 'lspconfig'.clangd.setup {}
-- require 'lspconfig'.neocmake.setup {}
-- require 'lspconfig'.yamlls.setup {}
-- require 'lspconfig'.dockerls.setup {}
-- require 'lspconfig'.marksman.setup {}
-- require 'lspconfig'.remark_ls.setup {}
-- require 'lspconfig'.tsserver.setup {}
-- require 'lspconfig'.java_language_server.setup {}
-- require 'lspconfig'.groovyls.setup {}
--
require("lsp/lspmain")
require("lsp/rust")
require("lsp/go")
require("lsp/python")
-- require("lsp/groovy")
require("lsp/completion")
require("lsp/grammar")
require("lsp/jsonls")
-- require("lsp/sumnekolua")

-- Telescope
require("telescopeconfig")

-- Prettier
require("prettierconfig")

-- Status line using lualine
require('lualine').setup {
    sections = {
        lualine_b = {
            {'branch'},
            {'diagnostics', sources={ 'coc' }}
        }
    }
}

-- coc.nvim
require('cocconfig')

-- Debugger nvim-dap
-- require("dapui").setup()
-- require("dap/dapconfig")
-- require("dap/daprust")

-- Debugger vimspector
vim.cmd([[
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'delve' ]
]])
