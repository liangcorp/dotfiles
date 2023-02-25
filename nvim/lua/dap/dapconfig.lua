local dap, dapui = require("dap"), require("dapui")
dapui.setup {}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--     dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--     dapui.close()
-- end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
    capabilities = capabilities,
})

require("nvim-dap-virtual-text").setup {}

vim.keymap.set("n", "<F3>", ":lua require'dap'.close()<CR>")
vim.keymap.set("n", "<F4>", ":lua require'dap'.restart()<CR>")

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader><F9>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F6>", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader><F5>", ":lua require'dapui'.close()<CR>")
