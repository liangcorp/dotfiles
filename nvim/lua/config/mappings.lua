-- Neovim native shortcuts
vim.g.mapleader = '\\'

-- Move block of code up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep curser in the same position
vim.keymap.set("n", "J", "mzJ`z")

-- Keep curser in the middle of screen during move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste over the highlighted word with copied word
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = '[P]aste Over' })

-- User system clip board
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "System Paste" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "System Paste" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "System Paste" })

-- Search terms stay on the middle line
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

local opts = { noremap = true, silent = true }

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind by [B]uffer' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]ind [O]old files' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })

-- Neotest
local neotest = require("neotest")
vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end, { desc = 'Run Nearest [T]est' })
vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = '[T]est Current File' })
vim.keymap.set("n", "<leader>ts", function() neotest.run.stop() end, { desc = '[S]top [T]est' })
vim.keymap.set("n", "<leader>ta", function() neotest.run.attach() end, { desc = '[T]est [A]ttrach' })
vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = false }) end, { desc = '[O]pen Output' })
vim.keymap.set("n", "<leader>tp", function() neotest.output_panel.open() end, { desc = 'Open [T]est [P]anel' })
vim.keymap.set("n", "<leader>tP", function() neotest.output_panel.close() end, { desc = 'Close [T]est [P]anel' })

-- Trouble
local trouble = require('trouble')
vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end, { desc = "Trouble Toggle" })
-- vim.keymap.set("n", "<leader>xx", ":TroubleToggle<CR>", { desc = "Trouble Toggle" })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
-- vim.keymap.set("n", "<leader>xw", function() trouble.toggle().workspace_diagnostics() end, { desc = "Trouble Toggle in Workspace" })
vim.keymap.set("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>", { desc = "Trouble Toggle in Document" })
-- vim.keymap.set("n", "<leader>xd", function() trouble.toggle().mode().document_diagnostics() end, { desc = "Trouble Toggle in Document" })
vim.keymap.set("n", "<leader>xl", ":TroubleToggle loclist<CR>", { desc = "Trouble Toggle Loclist" })
-- vim.keymap.set("n", "<leader>xl", function() trouble.toggle().loclist() end, { desc = "Trouble Toggle Loclist" })
vim.keymap.set("n", "<leader>xq", ":TroubleToggle quickfix<CR>", { desc = "Trouble Toggle Quickfix" })
-- vim.keymap.set("n", "<leader>xq", function() trouble.toggle().quickfix() end, { desc = "Trouble Toggle Quickfix" })
vim.keymap.set("n", "gR", ":TroubleToggle lsp_references<CR>", { desc = "Trouble Toggle LSP References" })
-- vim.keymap.set("n", "gR", function() trouble.toggle().lsp_references() end, { desc = "Trouble Toggle LSP References" })

-- Arial related shortcuts
local aerial = require('aerial')
vim.keymap.set('n', '<leader>ae', function() aerial.toggle() end, { desc = '[A]erial Toggle' })

-- Prettier
local prettier = require('prettier')
vim.keymap.set('n', '<space>p', function() prettier.format() end, { desc = '[P]rettier' })

-- NVIM Tree
local nvim_tree = require('nvim-tree')
vim.keymap.set('n', "<leader>zz", function() nvim_tree.toggle() end, { desc = "Nvim Tree" })

-- Debugger related shortcuts
local dap = require('dap')
vim.keymap.set("n", "<F3>", function() dap.close() end, { desc = 'Close Debugger' })
vim.keymap.set("n", "<F4>", function() dap.restart() end, { desc = 'Restart Debugger' })

vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = 'Continue Debugger' })
vim.keymap.set("n", "<F9>", function() dap.toggle_breakpoint() end, { desc = 'Set Breakpoint' })
vim.keymap.set("n", "<leader><F9>", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
    { desc = 'Set Breakpoint with Condition' }
)
vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = 'Step Over' })
vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = 'Step Into' })
vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = 'Step Out' })
vim.keymap.set("n", "<F6>", function() dap.repl.open() end, { desc = 'Replay Open' })

vim.keymap.set("n", "<leader>dc", function() require 'dapui'.close() end, { desc = 'Close Debugger UI' })

-- Debugger go
vim.keymap.set("n", "<leader>dg", function() require('dap-go').debug_test() end, { desc = "[D]ebug [G]o Test" })

-- Debugger python
local dap_python = require('dap-python')
vim.keymap.set("n", "<leader>pt", function() dap_python.test_method() end, { desc = "Debug [P]ythong [T]est" })
vim.keymap.set("n", "<leader>pc", function() dap_python.test_class() end, { desc = "Debug [P]ythong [C]lass" })
vim.keymap.set("n", "<leader>ps", function() dap_python.debug_selection(opts) end,
    { desc = "Debug [P]ythong [S]election" }
)
