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
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        -- stopOnEntry = false,
        stopAtBeginningOfMainSubprogram = false,
    },
}
-- rust configurations
dap.configurations.rust = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        -- stopOnEntry = false,
        stopAtBeginningOfMainSubprogram = false,
    },
}
dap.configurations.cpp = dap.configurations.c
