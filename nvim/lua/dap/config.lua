require("dapui").setup()

local dap          = require("dap")
local dapui        = require("dapui")

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("neodev").setup({
    -- library = { plugins = { "nvim-dap-ui" }, types = true },
    library = { plugins = { "nvim-dap-ui", "neotest" }, types = true },
    -- library = { plugins = { "nvim-dap-ui" }, types = true },
    capabilities = capabilities,
})

require('mason-nvim-dap').setup({
    automatic_installation = true,

    ensure_installed = {
        "debugpy",
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

require("nvim-dap-virtual-text").setup {
    commented = true,
}
