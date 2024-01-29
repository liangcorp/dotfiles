local dap = require('dap')

-- adapters
dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/codelldb"),
        args = { "--port", "${port}" },
    },
}

-- configurations
dap.configurations.c = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c