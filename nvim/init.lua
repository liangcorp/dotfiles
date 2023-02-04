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

    " colorscheme dracula
    colorscheme onedark

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

-- Keyboard mappings
require('mappings')

-- Git signs
require('gitsigns').setup()

-- Treesitter
require("nvim-tree").setup()
require("tree")

-- LSP Configurations
-- require'lspconfig'.pyright.setup{}
-- require("lsp/lspmain")
-- require("lsp/rust")
-- require("lsp/go")
-- require("lsp/python")
-- require("lsp/groovy")


-- Telescope
require("telescopeconfig")

-- Prettier
require("prettierconfig")

-- Status line using lualine
require('lualine').setup()

-- coc.nvim
require('cocconfig')

-- Debugger vimspector
vim.cmd([[
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'delve' ]
]])

