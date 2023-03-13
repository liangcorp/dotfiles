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

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind by [B]uffer' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]ind [O]old files' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fa', ':Telescope aerial<CR>', { desc = '[F]ind [A]erial' })

-- Neotest
-- local neotest = require("neotest")
vim.keymap.set("n", "<leader>tt", ":lua require('neotest').run.run()<CR>)",
    { desc = 'Run Nearest [T]est' }
)
vim.keymap.set("n", "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand(\"%\"))<CR>",
    { desc = '[T]est Current File' }
)
vim.keymap.set("n", "<leader>ts", ":lua require('neotest').run.stop()<CR>",
    { desc = '[S]top [T]est' }
)
vim.keymap.set("n", "<leader>ta", ":lua require('neotest').run.attach()<CR>",
    { desc = '[T]est [A]ttrach' }
)
vim.keymap.set("n", "<leader>to", ":lua require('neotest').output.open({ enter = false })<CR>",
    { desc = '[O]pen Output' }
)
vim.keymap.set("n", "<leader>tp", ":lua require('neotest').output_panel.open()<CR>",
    { desc = 'Open [T]est [P]anel' }
)
vim.keymap.set("n", "<leader>tP", ":lua require('neotest').output_panel.close()<CR>",
    { desc = 'Close [T]est [P]anel' }
)

-- Trouble
vim.keymap.set("n", "<leader>xx", ":TroubleToggle<CR>",
    { desc = "Trouble Toggle" }
)
vim.keymap.set("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>",
    { desc = "Trouble Toggle in Workspace" }
)
vim.keymap.set("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>",
    { desc = "Trouble Toggle in Document" }
)
vim.keymap.set("n", "<leader>xl", ":TroubleToggle loclist<CR>",
    { desc = "Trouble Toggle Loclist" }
)
vim.keymap.set("n", "<leader>xq", ":TroubleToggle quickfix<CR>",
    { desc = "Trouble Toggle Quickfix" }
)
vim.keymap.set("n", "gR", ":TroubleToggle lsp_references<CR>",
    { desc = "Trouble Toggle LSP References" }
)

-- Arial related shortcuts
vim.keymap.set('n', '<leader>ae', ':AerialToggle!right<CR>', { desc = '[A]erial Toggle' })

-- Prettier
vim.keymap.set('n', '<space>p', ':Prettier<CR>', { desc = '[P]rettier' })

-- NVIM Tree
vim.keymap.set('n', "<leader>zz", ":NvimTreeToggle<CR>", { desc = "Nvim Tree" })

-- Debugger related shortcuts
vim.keymap.set("n", "<F3>", ":lua require'dap'.close()<CR>", { desc = 'Close Debugger' })
vim.keymap.set("n", "<F4>", ":lua require'dap'.restart()<CR>", { desc = 'Restart Debugger' })

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", { desc = 'Continue Debugger' })
vim.keymap.set("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = 'Set Breakpoint' })
vim.keymap.set("n", "<leader><F9>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    { desc = 'Set Breakpoint with Condition' }
)
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", { desc = 'Step Over' })
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>", { desc = 'Step Into' })
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>", { desc = 'Step Out' })
vim.keymap.set("n", "<F6>", ":lua require'dap'.repl.open()<CR>", { desc = 'Replay Open' })
vim.keymap.set("n", "<leader>dc", ":lua require'dapui'.close()<CR>", { desc = 'Close Debugger UI' })

-- Debugger go
vim.keymap.set("n", "<leader>dg", ":lua require('dap-go').debug_test()<CR>",
    { desc = "[D]ebug [G]o Test" }
)

-- Debugger python
vim.keymap.set("n", "<leader>pt", ":lua require('dap-python').test_method()<CR>",
    { desc = "Debug [P]ythong [T]est" }
)
vim.keymap.set("n", "<leader>pc", ":lua require('dap-python').test_class()<CR>",
    { desc = "Debug [P]ythong [C]lass" }
)
vim.keymap.set("n", "<leader>ps", ":lua require('dap-python').debug_selection()<CR>",
    { desc = "Debug [P]ythong [S]election" }
)
