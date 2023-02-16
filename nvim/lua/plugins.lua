return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    -- use('sheerun/vim-polyglot')
    -- use('fatih/vim-go')
    use('neoclide/coc.nvim')
    use('nvim-lua/plenary.nvim')

    -- Telescope
    use('nvim-telescope/telescope.nvim')
    use('nvim-telescope/telescope-symbols.nvim')

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter')

    -- Directory Tree
    use('kyazdani42/nvim-tree.lua')
    -- use('tpope/vim-fugitive')

    -- Themes
    use('Mofiqul/dracula.nvim')
    use('navarasu/onedark.nvim')
    use 'folke/tokyonight.nvim'

    -- lualine status line
    use('kyazdani42/nvim-web-devicons') -- optional, for file icons
    use('nvim-lualine/lualine.nvim')

    -- NVIM Lint
    use('mfussenegger/nvim-lint')

    -- Arie line
    use('stevearc/aerial.nvim')

    -- Track the engine.
    -- use('SirVer/ultisnips')

    -- Snippets are separated from the engine. Add this if you want them:
    use('neovim/nvim-lspconfig')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('hrsh7th/nvim-cmp')
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    -- use('neomake/neomake')
    use('hrsh7th/cmp-vsnip')
    use('hrsh7th/vim-vsnip')

    -- Grammar Guard
    use('brymer-meneses/grammar-guard.nvim')
    -- use('williamboman/nvim-lsp-installer')

    -- Magit for neovim
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use('lewis6991/gitsigns.nvim')

    -- Extra packages for rust
    use('rust-lang/rust.vim')

    -- Toggle comments
    use('numToStr/Comment.nvim')

    -- Markdown
    -- use({
    --     'iamcco/markdown-preview.nvim',
    --     run = "cd app && npm install",
    --     setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    --     ft = { "markdown" },
    -- })
    -- Debugger
    -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    -- use('leoluz/nvim-dap-go')
    -- use("folke/neodev.nvim")

    use('puremourning/vimspector')
end)
