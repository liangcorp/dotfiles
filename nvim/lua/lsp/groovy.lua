require'lspconfig'.groovyls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "java", "-jar", "/home/cliang/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar" },
}
