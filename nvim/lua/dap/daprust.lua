    local dap = require('dap')

    dap.adapters.lldb = {
        type = 'server',
        port = "${port}",
        executable = {
        command = '/usr/local/bin/codelldb',
        args = {"--port", "${port}"},
        },
        name = 'lldb'
    }

    dap.configurations.rust = {
      {
        type = 'lldb',
        request = 'launch',
        name = "Rust Debug",
        program = function()
            vim.fn.jobstart('cargo build')
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        rustPath = function()
          return '~/.cargo/bin/rustup'
        end;
      },
    }
