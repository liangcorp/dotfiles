require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
