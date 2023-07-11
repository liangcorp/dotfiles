local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Telescope
    use 'nvim-telescope/telescope-symbols.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Indent Blanline
    use 'lukas-reineke/indent-blankline.nvim'

    -- Illuminate same words
    use 'RRethy/vim-illuminate'

    -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
    -- So for api plugins like devicons, we can always set lazy=true
    use "nvim-tree/nvim-web-devicons"

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- Nvim Tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    -- Themes
    -- 'Mofiqul/dracula.nvim'
    use 'navarasu/onedark.nvim'
    use 'folke/tokyonight.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'rebelot/kanagawa.nvim'
    use 'sainnhe/everforest'

    use { "catppuccin/nvim", as = "catppuccin" }

    -- Lualine status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- NVIM Lint
    use 'mfussenegger/nvim-lint'

    use 'mfussenegger/nvim-jdtls'

    -- Arie (list and move between functions
    use 'stevearc/aerial.nvim'

    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = "nvim-web-devicons",       -- keep this if you're using NvChad
        config = function()
            require("barbecue").setup()
        end,
    })

    -- LSP server installer and manager
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- Text and code completions
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            -- Snippets
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        }
    }

    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'petertriho/cmp-git'

    -- Show Error in Trouble Window
    use 'folke/trouble.nvim'

    -- Show TODO in highlight
    use 'folke/todo-comments.nvim'

    -- null-ls
    -- {
    --     'jose-elias-alvarez/null-ls.nvim',
    --     ft = { "python" },
    --     opts = function()
    --         return require('config/null_ls')
    --     end,
    -- },

    -- Prettier
    use {
        'MunifTanjim/prettier.nvim',
        requires = {
            'neovim/nvim-lspconfig'
        },
    }

    -- Make
    use 'neomake/neomake'

    -- Magit for neovim
    -- {
    --     'TimUntersberger/neogit',
    --     dependencies = { 'nvim-lua/plenary.nvim' }
    -- },
    -- Git related
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    -- Git signes
    use 'lewis6991/gitsigns.nvim'

    -- Extra packages for rust
    -- 'rust-lang/rust.vim'
    use 'simrat39/rust-tools.nvim'

    -- Toggle comments
    use 'numToStr/Comment.nvim'

    -- Neotest
    use {
        'nvim-neotest/neotest',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-neotest/neotest-python',
            'nvim-neotest/neotest-plenary',
            'nvim-neotest/neotest-vim-test',
            'nvim-neotest/neotest-go',
            'rouge8/neotest-rust',
            -- "haydenmeade/neotest-jest",
            'antoinemadec/FixCursorHold.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        -- build = 'cargo install cargo-nextest',
    }

    -- Markdown preview
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Debugger
    use {
        'jay-babu/mason-nvim-dap.nvim',
        'mxsdev/nvim-dap-vscode-js',
        'mfussenegger/nvim-dap',
        -- {
        --     'microsoft/vscode-js-debug',
        --     build = 'npm install --legacy-peer-deps && npm run compile'
        -- },
        'theHamsta/nvim-dap-virtual-text',
        'nvim-telescope/telescope-dap.nvim',
        requires = {
            'folke/neodev.nvim',
            'mfussenegger/nvim-dap'
        },
    }

    use {
        'rcarriga/nvim-dap-ui',
        requires = {
            'mfussenegger/nvim-dap'
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    }

    use {
        'leoluz/nvim-dap-go',
        requires = {
            'mfussenegger/nvim-dap'
        },
    }

    use {
        'mfussenegger/nvim-dap-python',
        requires = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("dap-python").test_runner = 'pytest'
        end
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
