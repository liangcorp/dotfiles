local dap = require('dap')

-- adapters
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" }
}

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/codelldb"),
        args = { "--port", "${port}" },
    },
}

-- c/cpp configurations
dap.configurations.c = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        args = function()
            local args_string = vim.fn.input("Input arguments: ")
            return vim.split(args_string, " ")
        end,
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        -- stopOnEntry = false,
        stopAtBeginningOfMainSubprogram = false,
        stopAtEntry = true,
    },
}
-- rust configurations
dap.configurations.rust = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        args = function()
            local args_string = vim.fn.input("Input arguments: ")
            return vim.split(args_string, " ")
        end,
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        -- stopOnEntry = false,
        stopAtBeginningOfMainSubprogram = false,
        stopAtEntry = true,
    },
}
dap.configurations.cpp = dap.configurations.c
