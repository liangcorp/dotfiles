return {
    "lawrence-laz/neotest-zig",
    dependencies = {
        "nvim-neotest/neotest",
    },
    lazy = true,
    ft = { "zig" },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-zig"),
            },
        })
    end,
}
