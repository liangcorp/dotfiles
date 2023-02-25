return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use('nvim-lua/plenary.nvim')

    -- Telescope
    use('nvim-telescope/telescope.nvim')
    use('nvim-telescope/telescope-symbols.nvim')

    -- Indent Blanline
    use("lukas-reineke/indent-blankline.nvim")

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter')

    -- Directory Tree
    use('kyazdani42/nvim-tree.lua')

    -- Themes
    use('Mofiqul/dracula.nvim')
    use('navarasu/onedark.nvim')

    -- lualine status line
    use('kyazdani42/nvim-web-devicons') -- optional, for file icons
    use('nvim-lualine/lualine.nvim')

    -- NVIM Lint
    use('mfussenegger/nvim-lint')

    -- Arie (list and move between functions)
    use('stevearc/aerial.nvim')

    --  Neovim Language Server Protocol client
    use('neovim/nvim-lspconfig')

    -- LSP format
    use('lukas-reineke/lsp-format.nvim')

    -- LSP server installer and manager
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    -- Text and code completions
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('hrsh7th/nvim-cmp')

    -- Show Error in Trouble Window
    use('folke/trouble.nvim')

    -- Prettier
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    -- Make
    use('neomake/neomake')

    -- Snippets
    use('hrsh7th/cmp-vsnip')
    use('hrsh7th/vim-vsnip')

    -- Grammar Guard
    use('brymer-meneses/grammar-guard.nvim')

    -- Magit for neovim
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use('lewis6991/gitsigns.nvim')

    -- Extra packages for rust
    use('rust-lang/rust.vim')
    use('simrat39/rust-tools.nvim')

    -- Toggle comments
    use('numToStr/Comment.nvim')

    -- Vim Test
    use('vim-test/vim-test')

    -- Markdown preview
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Debugger
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use('leoluz/nvim-dap-go')
    use('mfussenegger/nvim-dap-python')
    use('theHamsta/nvim-dap-virtual-text')
    use('nvim-telescope/telescope-dap.nvim')
    use("folke/neodev.nvim")
end)
