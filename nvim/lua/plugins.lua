return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use('sheerun/vim-polyglot')
  use('rust-lang/rust.vim')
  use('prabirshrestha/vim-lsp')
  use('neoclide/coc.nvim')
  use('nvim-lua/plenary.nvim')
  use('nvim-telescope/telescope.nvim')
  use('nvim-telescope/telescope-symbols.nvim')
  use('nvim-treesitter/nvim-treesitter')
  use('lewis6991/gitsigns.nvim')
  use('kyazdani42/nvim-tree.lua')
  use('tpope/vim-fugitive')

  use('Mofiqul/dracula.nvim')
  use('navarasu/onedark.nvim')

-- lualine status line
  use('kyazdani42/nvim-web-devicons') -- optional, for file icons
  use('nvim-lualine/lualine.nvim')

-- Track the engine.
  use('SirVer/ultisnips')

-- Snippets are separated from the engine. Add this if you want them:
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

-- Debugger
  -- use('mfussenegger/nvim-dap')
  use('puremourning/vimspector')
end)
