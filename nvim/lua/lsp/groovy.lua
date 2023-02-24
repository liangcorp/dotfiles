local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}
local on_attach = require("lsp-format").on_attach

require 'lspconfig'.groovyls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "java", "-jar", "/home/cliang/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar" },
}
