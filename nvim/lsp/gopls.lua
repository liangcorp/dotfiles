return {
    cmd = { 'gopls', 'serve' },
    filetypes = { "go", "gomod", "gowork" },
    root_markers = { "go.work", "go.mod" },
    single_file_support = true,

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
    }
}
