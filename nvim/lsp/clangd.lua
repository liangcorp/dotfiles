return {
  cmd = {
    "clangd",
    "--background-index",
    "--pretty",
    "--clang-tidy",
    "--completion-style=bundled",
    "--cross-file-rename",
    "--header-insertion=iwyu",
    },
    root_markers = { "Makefile", 'compile_commands.json', 'compile_flags.txt' },
    filetypes = { "arduino", "c", "cpp" },
}
