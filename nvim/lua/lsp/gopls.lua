flags = lsp_flags,
cmd = { 'gopls', 'serve' },
filetypes = { "go", "gomod", "gowork", "gotmpl" },
root_dir = util.root_pattern("go.work", "go.mod", ".git"),
single_file_support = true,
-- for postfix snippets and analyzers
capabilities = capabilities,
settings = {
    gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
            fieldalignment = true,
            unusedparams = true,
            shadow = true,
        },
        staticcheck = true,
    },
},
