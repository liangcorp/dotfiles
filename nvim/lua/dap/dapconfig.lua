local dap, dapui = require("dap"), require("dapui")

-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
dapui.setup {
    -- Set icons to characters that are more likely to work in every terminal.
    --    Feel free to remove or use ones that you like more! :)
    --    Don't feel like these are good choices.
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
        icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
        },
    },
}
require('mason-nvim-dap').setup {
    -- Makes a best effort to setup the various debuggers with
    -- reasonable debug configurations
    automatic_setup = true,

    -- You'll need to check that you have the required things installed
    -- online, please don't ask me how to install them :)
    ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        "python",
        "delve",
        "codelldb"
    },
}
require('mason-nvim-dap').setup_handlers()

dap.listeners.after.event_initialized["dapui_config"] = dapui.open()
dap.listeners.before.event_terminated["dapui_config"] = dapui.close()
dap.listeners.before.event_exited["dapui_config"] = dapui.close()

require("nvim-dap-virtual-text").setup {}
