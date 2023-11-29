local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("neodev").setup({
    -- library = { plugins = { "nvim-dap-ui", "neotest" }, types = true },
    library = { plugins = { "nvim-dap-ui" }, types = true },
    capabilities = capabilities,
})
