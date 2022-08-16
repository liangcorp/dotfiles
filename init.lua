local vim = vim
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local fn = vim.fn
local execute = vim.api.nvim_command

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
 local use = use
  -- add you plugins here like:
  -- use 'neovim/nvim-lspconfig'
use 'itchyny/lightline.vim'
use 'dense-analysis/ale'
use {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
use 'rust-lang/rust.vim'
use 'fatih/vim-go'
use 'tpope/vim-fugitive'
use 'prabirshrestha/vim-lsp'
use 'mattn/vim-lsp-settings'
use 'neoclide/coc.nvim'
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/vim-vsnip-integ'
use 'puremourning/vimspector'
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use 'nvim-telescope/telescope-symbols.nvim'
-- Better code highlight
use 'sheerun/vim-polyglot'
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

-- these are optional themes but I hear good things about gloombuddy
-- colorbuddy allows us to run the gloombuddy theme
-- use 'tjdevries/colorbuddy.nvim'
-- use 'bkegley/gloombuddy'

-- Show difference from git repo
use 'lewis6991/gitsigns.nvim'

-- Tree view for directory
use 'kyazdani42/nvim-web-devicons' -- optional, for file icons
use 'kyazdani42/nvim-tree.lua'

use 'Mofiqul/dracula.nvim'
use 'joshdick/onedark.vim'

-- Track the engine.
use 'SirVer/ultisnips'

-- Snippets are separated from the engine. Add this if you want them:
use 'honza/vim-snippets'

  end
)

o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false
bo.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true
o.incsearch = true
o.hidden = true
o.completeopt='menuone,noinsert,noselect'
bo.autoindent = true
bo.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.wrap = true

vim.g.colors_name = 'dracula'

local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  }
}
