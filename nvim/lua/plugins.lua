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
        "nvim-telescope/telescope-symbols.nvim",
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Configurations with modifications
    -- Indent Blanline
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- Illuminate same words
    "RRethy/vim-illuminate",

    -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
    -- So for api plugins like devicons, we can always set lazy=true
    -- { "nvim-tree/nvim-web-devicons", lazy = true },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
    },

    -- {
    --     'nvim-tree/nvim-tree.lua',
    --     tag = 'nightly'
    -- },

    -- Themes
    -- 'Mofiqul/dracula.nvim'
    "navarasu/onedark.nvim",
    "folke/tokyonight.nvim",
    "EdenEast/nightfox.nvim",
    "sainnhe/everforest",
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        'uloco/bluloco.nvim',
        lazy = false,
        priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' },
        config = function()
            -- your optional config goes here, see below.
        end,
    },

    -- Lualine status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- See `:help lualine.txt`
        -- opts = {
        --     options = {
        --         component_separators = '|',
        --         section_separators = '',
        --     },
        -- },
        -- config = function()
        --     require("lualine").setup({})
        -- end,
    },

    -- NVIM Lint
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {
                markdown = { "markdownlint" },
            }

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })

            vim.api.nvim_create_autocmd({ "InsertLeave" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },

    "mfussenegger/nvim-jdtls",

    -- Arie (list and move between functions
    "stevearc/aerial.nvim",

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
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },

    -- Text and code completions
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            -- Snippets
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },

        config = function()
            require("luasnip").setup({})
        end,
    },

    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "petertriho/cmp-git",

    -- Show Error in Trouble Window
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Show TODO in highlight
    {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },

    -- Prettier
    {
        "MunifTanjim/prettier.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            -- 'jose-elias-alvarez/null-ls.nvim'
            "nvimtools/none-ls.nvim",
        },
    },

    -- Make
    {
        "neomake/neomake",
    },

    -- Magit for neovim
    -- {
    --     'TimUntersberger/neogit',
    --     dependencies = { 'nvim-lua/plenary.nvim' }
    -- },
    -- Git related
    {
        "tpope/vim-fugitive",
        "tpope/vim-rhubarb",
    },

    -- Git signes
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})
        end,
    },

    -- Toggle comments
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({})
        end,
    },

    -- Neotest
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-plenary",
            "nvim-neotest/neotest-vim-test",
            "nvim-neotest/neotest-go",
            "rouge8/neotest-rust",
            -- "haydenmeade/neotest-jest",
        },
        -- build = 'cargo install cargo-nextest',
    },

    -- Markdown preview
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        build = ":call mkdp#util#install()",
    },

    -- Copilot - disabled due to pay subscription
    -- 'github/copilot.vim',

    -- Create pairing brackets and quotation marks
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },

    -- Debugger
    {
        "jay-babu/mason-nvim-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "folke/neodev.nvim",
            "mfussenegger/nvim-dap",
        },
    },

    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "folke/neodev.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("dap-go").setup({})
        end,
    },

    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("dap-python").test_runner = "pytest"
        end,
    },

    {
        "microsoft/vscode-js-debug",
        -- After install, build it and rename the dist directory to out
        build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
        version = "1.*",
    },

    {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("dap-vscode-js").setup({
                -- Path of node executable. Defaults to $NODE_PATH, and then "node"
                -- node_path = "node",

                -- Path to vscode-js-debug installation.
                debugger_path = vim.fn.expand(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

                -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
                -- debugger_cmd = { "js-debug-adapter" },

                -- which adapters to register in nvim-dap
                adapters = {
                    "chrome",
                    "pwa-node",
                    "pwa-chrome",
                    "pwa-msedge",
                    "pwa-extensionHost",
                    "node-terminal",
                },

                -- Path for file logging
                -- log_file_path = "(stdpath cache)/dap_vscode_js.log",

                -- Logging level for output to file. Set to false to disable logging.
                -- log_file_level = false,

                -- Logging level for output to console. Set to false to disable console output.
                -- log_console_level = vim.log.levels.ERROR,
            })
        end,
    },
})
