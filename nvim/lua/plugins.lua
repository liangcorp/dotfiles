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

require('lazy').setup({
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'nvim-telescope/telescope-symbols.nvim',

    -- Indent Blanline
    'lukas-reineke/indent-blankline.nvim',

    -- Illuminate same words
    'RRethy/vim-illuminate',

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    },

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        tag = 'nightly'
    },

    -- Themes
    -- 'Mofiqul/dracula.nvim'
    'navarasu/onedark.nvim',
    'folke/tokyonight.nvim',
    'EdenEast/nightfox.nvim',
    { 'catppuccin/nvim', name = 'catppuccin' },

    -- Lualine status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        -- See `:help lualine.txt`
        opts = {
            options = {
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    -- NVIM Lint
    'mfussenegger/nvim-lint',

    -- Arie (list and move between functions
    'stevearc/aerial.nvim',

    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
    },
    -- LSP server installer and manager
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
    },

    -- Text and code completions
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            -- Snippets
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        }
    },

    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'petertriho/cmp-git',

    -- Show Error in Trouble Window
    'folke/trouble.nvim',

    -- Show TODO in highlight
    {
        'folke/todo-comments.nvim',
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },

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

    -- Magit for neovim
    -- {
    --     'TimUntersberger/neogit',
    --     dependencies = { 'nvim-lua/plenary.nvim' }
    -- },
    -- Git related
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- Git signes
    'lewis6991/gitsigns.nvim',

    -- Extra packages for rust
    -- 'rust-lang/rust.vim'
    'simrat39/rust-tools.nvim',

    -- Toggle comments
    'numToStr/Comment.nvim',

    -- Neotest
    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-neotest/neotest-python',
            'nvim-neotest/neotest-plenary',
            'nvim-neotest/neotest-vim-test',
            'nvim-neotest/neotest-go',
            'rouge8/neotest-rust',
            -- "haydenmeade/neotest-jest",
        },
        build = 'cargo install cargo-nextest'
    },

    -- Markdown preview
    -- install without yarn or npm
    {
        'iamcco/markdown-preview.nvim',
        build = ':call mkdp#util#install()',
    },

    -- Copilot - disabled due to pay subscription
    -- 'github/copilot.vim',

    -- Debugger
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'folke/neodev.nvim',
            'mfussenegger/nvim-dap'
        }
    },
    'leoluz/nvim-dap-go',
    'jay-babu/mason-nvim-dap.nvim',
    'mfussenegger/nvim-dap-python',
    'mxsdev/nvim-dap-vscode-js',
    {
        'microsoft/vscode-js-debug',
        dependencies = { "mfussenegger/nvim-dap" },
        build = 'npm install --legacy-peer-deps && npm run compile'
    },
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
})
