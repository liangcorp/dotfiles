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
vim.keymap.set("x", "<leader>p", "\"_dP")

-- User system clip board
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Search terms stay on the middle line
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- VIM Test related
vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>")
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>")
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>")
vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>")

-- Trouble
vim.keymap.set("n", "<leader>xx", ":TroubleToggle<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", ":TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", ":TroubleToggle loclist<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", ":TroubleToggle quickfix<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "gR", ":TroubleToggle lsp_references<cr>",
    { silent = true, noremap = true }
)

-- Nvim Tree
vim.keymap.set('n', '<leader>zz', ':NvimTreeToggle<CR>')

-- Arial related shortcuts
vim.keymap.set('n', '<leader>ae', ':AerialToggle!right<CR>')

-- Debugger related shortcuts
vim.keymap.set("n", "<F3>", ":lua require'dap'.close()<CR>")
vim.keymap.set("n", "<F4>", ":lua require'dap'.restart()<CR>")

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader><F9>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F6>", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>tc", ":lua require'dapui'.close()<CR>")

-- Debugger go
vim.keymap.set("n", "<leader>td", ":lua require('dap-go').debug_test()<CR>")

-- Debugger python
vim.keymap.set("n", "<leader>pt", ":lua require('dap-python').test_method()<CR>")
vim.keymap.set("n", "<leader>pc", ":lua require('dap-python').test_class()<CR>")
vim.keymap.set("n", "<leader>ps", ":lua require('dap-python').debug_selection()<CR>")
