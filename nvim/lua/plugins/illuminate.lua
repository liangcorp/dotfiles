return {

    "RRethy/vim-illuminate",
    -- ft = {
    --     "go",
    --     "rust",
    --     "c",
    --     "cpp",
    --     "html",
    --     "java",
    --     "css",
    --     "javascript",
    --     "typescript",
    --     "yaml",
    -- },
    keys = {
        {
            "<leader>it",
            function()
                require('illuminate').toggle()
            end,
            desc = { "[I]lluminate [T]oggle" }
        },
    },
    lazy=true,
}
