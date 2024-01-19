local dap, dapui = require("dap"), require("dapui")

require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

require('mason-nvim-dap').setup({
    automatic_installation = true,

    ensure_installed = {
        "python",
        "delve",
        "codelldb",
        "js-debug-adapter"
    }
})

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

require("nvim-dap-virtual-text").setup {}
