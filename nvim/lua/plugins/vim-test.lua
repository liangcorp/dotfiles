return {
    'vim-test/vim-test',
    keys = {
        {"<leader>tt", ":TestNearest -strategy=neovim<CR>"},
        {"<leader>tf", ":TestFile -strategy=neovim<CR>"},
        {"<leader>ta", ":TestSuite -strategy=neovim<CR>"},
        {"<leader>tl", ":TestLast -strategy=neovim<CR>"},
        {"<leader>tg", ":TestVisit -strategy=neovim<CR>"},
    },
    lazy = true,
}
