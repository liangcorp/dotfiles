return {

    "RRethy/vim-illuminate",
    keys = {
        {
            "<leader>it",
            function()
                require('illuminate').toggle()
            end,
            desc = { "[I]lluminate [T]oggle" }
        },
    },
}
