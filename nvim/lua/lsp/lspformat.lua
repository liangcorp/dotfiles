require("lsp-format").setup {}

require("lspconfig").gopls.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").yamlls.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").rust_analyzer.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").jsonls.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").groovyls.setup { on_attach = require("lsp-format").on_attach }

