local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'nvim-telescope/telescope-symbols.nvim',

    -- Indent Blanline
    "lukas-reineke/indent-blankline.nvim",

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
    },

    -- Directory Tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            { "<leader>zz", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
        },
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            "MunifTanjim/nui.nvim"
        },
        config = function()
            require("neo-tree").setup()
        end
    },

    -- Themes
    -- 'Mofiqul/dracula.nvim'
    'navarasu/onedark.nvim',

    -- Lualine status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },

    -- NVIM Lint
    'mfussenegger/nvim-lint',

    -- Arie (list and move between functions
    'stevearc/aerial.nvim',

    -- LSP server installer and manager
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig'
        }
    },

    -- Text and code completions
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    -- Show Error in Trouble Window
    'folke/trouble.nvim',

    -- Prettier
    {
        'MunifTanjim/prettier.nvim',
        dependencies = {
            'jose-elias-alvarez/null-ls.nvim',
            'neovim/nvim-lspconfig'
        },
    },

    -- Make
    'neomake/neomake',

    -- Snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Magit for neovim
    -- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    'tpope/vim-fugitive',
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    -- Extra packages for rust
    -- 'rust-lang/rust.vim'
    'simrat39/rust-tools.nvim',

    -- Toggle comments
    'numToStr/Comment.nvim',

    -- Vim Test
    'vim-test/vim-test',
    -- Neotest
    -- use {
    --     "nvim-neotest/neotest",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --         "nvim-neotest/neotest-python",
    --         "nvim-neotest/neotest-plenary",
    --         "nvim-neotest/neotest-vim-test",
    --         -- "rouge8/neotest-rust",
    --     },
    -- }

    -- Markdown preview
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        build = ":lua vim.fn[\"mkdp#util#install\"]"
    },

    -- Debugger
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "folke/neodev.nvim",
            "mfussenegger/nvim-dap"
        }
    },
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
    "mxsdev/nvim-dap-vscode-js",
    {
        "microsoft/vscode-js-debug",
        dependencies = { "mfussenegger/nvim-dap" },
        build = "npm install --legacy-peer-deps && npm run compile"
    },
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
})
