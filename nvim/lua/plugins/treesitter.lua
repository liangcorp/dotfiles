return {
    "nvim-treesitter/nvim-treesitter",
    -- "rayliwell/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    ft = {
        "c",
        "cpp",
        "go",
        "rust",
        -- "tex",
        -- "make",
        "markdown",
        "yaml",
        "json",
        -- "zig",
        "javascript",
        "typescript",
        "html",
        "css",
        "java",
        "lua",
        -- "groovy",
        -- "xml",
        "git",
        "sh",
        "python"
    },
    -- cmd = "TSEnable",
    config = function()
        pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        local ts = require("nvim-treesitter")
        local parsers = { "lua", "vim", "vimdoc", "bash", "markdown", "rust", "c", "cpp", "go", "python" }

        for _, parser in ipairs(parsers) do
            pcall(ts.install, parser)
        end

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
    -- lazy = true,
}
