-- setup LSP config
require('grammar-guard').init()
require("lspconfig").grammar_guard.setup({
    cmd = { '/home/cliang/.local/share/nvim/lsp_servers/ltex/ltex-ls/bin/ltex-ls' }, -- add this if you install ltex-ls yourself
	settings = {
		ltex = {
			enabled = { "latex", "tex", "bib", "markdown", "text", "gitcommit", "org", "plaintex", "pandoc" },
			language = "en-GB",
			diagnosticSeverity = "information",
			setenceCacheSize = 2000,
			additionalRules = {
				enablePickyRules = true,
				motherTongue = "en",
			},
			trace = { server = "verbose" },
			dictionary = {},
			disabledRules = {},
			hiddenFalsePositives = {},
		},
	},
})
