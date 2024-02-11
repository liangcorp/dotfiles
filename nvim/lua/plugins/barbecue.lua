return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",     -- optional dependency
    },
    ft = {
        "yaml",
        "json",
        "xml",
    },
    opts = {
        -- configurations go here
    },
    lazy = true,
}
