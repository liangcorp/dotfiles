local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Debugger related shortcuts
local dap = require('dap')
keymap.set("n", "<F3>", function()
    dap.close()
end, { desc = 'Close Debugger' })

keymap.set("n", "<F4>", function()
    dap.restart()
end, { desc = 'Restart Debugger' })

keymap.set("n", "<F5>", function()
    dap.continue()
end, { desc = 'Continue Debugger' })

keymap.set("n", "<F9>", function()
    dap.toggle_breakpoint()
end, { desc = 'Set Breakpoint' })

keymap.set("n", "<leader><F9>", function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = 'Set Breakpoint with Condition' })

keymap.set("n", "<F10>", function()
    dap.step_over()
end, { desc = 'Step Over' })

keymap.set("n", "<F11>", function()
    dap.step_into()
end, { desc = 'Step Into' })

keymap.set("n", "<F12>", function()
    dap.step_out()
end, { desc = 'Step Out' })

keymap.set("n", "<F6>", function()
    dap.repl.open()
end, { desc = 'Replay Open' })

keymap.set("n", "<leader>dc", function()
    require 'dapui'.close()
end, { desc = 'Close Debugger UI' })

-- Debugger go
keymap.set("n", "<leader>dg", function()
    require('dap-go').debug_test()
end, { desc = "[D]ebug [G]o Test" })

-- Debugger python
local dap_python = require('dap-python')
keymap.set("n", "<leader>pt", function()
    dap_python.test_method()
end, { desc = "Debug [P]ythong [T]est" })

keymap.set("n", "<leader>pc", function()
    dap_python.test_class()
end, { desc = "Debug [P]ythong [C]lass" })

keymap.set("n", "<leader>ps", function()
    dap_python.debug_selection(opts)
end, { desc = "Debug [P]ythong [S]election" })

