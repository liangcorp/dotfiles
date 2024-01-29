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
    require("plugins.telescope"),

    -- Indent Blanline
    require("plugins.indent"),

    -- Treesitter
    require("plugins.treesitter"),

    -- Nvim-tree
    require("plugins.nvim-tree"),

    -- Harpoon
    'ThePrimeagen/harpoon',

    -- Illuminate same words
    "RRethy/vim-illuminate",

    -- Themes
    "navarasu/onedark.nvim",

    -- Lualine status line
    require("plugins.lualine"),

    -- NVIM Lint
    {
        "mfussenegger/nvim-lint",
        ft = { "markdown" },
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

    {
        "mfussenegger/nvim-jdtls",
        ft = { "java" },
    },

    -- Arie (list and move between functions
    "stevearc/aerial.nvim",

    -- This is a VS Code like winbar
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
        ft = {},
        config = function()
            require 'lspconfig'.yamlls.setup {}
            require 'lspconfig'.dockerls.setup {}
            require 'lspconfig'.marksman.setup {}
            require 'lspconfig'.neocmake.setup {}
            require("config.masonconfig")
        end,
        lazy = true,
    },

    -- Neovim plugin to manage global and project-local settings.
    {
        "folke/neoconf.nvim",

        config = function()
            -- Neoconf differentiate between local and global project setting
            require("neoconf").setup({
                -- override any of the default settings here
            })
        end,
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
        ft = { "c",
            "cpp",
            "python",
            "go",
            "rust",
            "javascript",
            "typescript" },
        lazy = true,
        config = function()
            require('keymaps.trouble')
            require('navigation.trouble')
        end
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
        lazy = true,
    },

    -- Prettier
    {
        "MunifTanjim/prettier.nvim",
        ft = { "markdown",
            "javascript",
            "typescript",
            "yaml",
            "json" },
        dependencies = {
            "neovim/nvim-lspconfig",
            -- 'jose-elias-alvarez/null-ls.nvim'
            "nvimtools/none-ls.nvim",
        },
        lazy = true,
        config = function()
            require("null.none_ls")
            require("null.prettierconfig")
            require("keymaps.prettier")
        end,
    },

    -- Git related
    {
        "tpope/vim-fugitive",
        "tpope/vim-rhubarb",
        lazy = true,
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
            "nvim-neotest/neotest-plenary",
            "nvim-neotest/neotest-vim-test",
            "rouge8/neotest-rust",
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-python",
            "lawrence-laz/neotest-zig",
            -- "haydenmeade/neotest-jest",
        },
        ft = { "zig", "rust", "python", "go" },
        lazy = true,
        config = function()
            require("keymaps.neotest")
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                    }),
                    require("neotest-plenary"),
                    require("neotest-rust"),
                    require("neotest-zig"),
                    require("neotest-go"),
                    require("neotest-vim-test")({
                        ignore_file_types = { "python", "vim", "lua" },
                    }),
                    -- Testing for javascript in the future
                    -- require('neotest-jest')({
                    --     jestCommand = "npm test --",
                    --     jestConfigFile = "custom.jest.config.ts",
                    --     env = { CI = true },
                    --     cwd = function(path)
                    --         return vim.fn.getcwd()
                    --     end,
                    -- }),
                },
            })
        end
        -- build = 'cargo install cargo-nextest',
    },

    -- Markdown preview
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

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
        ft = { "rust",
            "java",
            "c",
            "cpp",
            "javascript",
            "typescript" },
        config = function()
            require("dapui").setup()
            require("dap.config")
            require("dap.adapters")
            require("config.neodev")
        end,
        lazy = true,
    },

    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "folke/neodev.nvim",
            "mfussenegger/nvim-dap",
        },
        ft = { "go" },
        config = function()
            require("dap-go").setup({})
        end,
        lazy = true,
    },

    {
        "mfussenegger/nvim-dap-python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        ft = { "python" },
        config = function()
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("dap-python").test_runner = "pytest"
        end,
        lazy = true,
    },

    -- {
    --     "microsoft/vscode-js-debug",
    --     -- After install, build it and rename the dist directory to out
    --     build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
    --     version = "1.*",
    -- },

    {
        "mxsdev/nvim-dap-vscode-js",
        ft = { "javascript", "typescript" },
        config = function()
            require("dap.javascript")
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
        lazy = true,
    },
})
