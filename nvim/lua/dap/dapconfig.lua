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
