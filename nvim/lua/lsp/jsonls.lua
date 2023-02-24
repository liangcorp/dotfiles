--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = require("lsp-format").on_attach

require 'lspconfig'.jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
