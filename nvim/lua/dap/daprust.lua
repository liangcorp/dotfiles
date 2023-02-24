    local dap = require('dap')
    dap.configurations.rust = {
      {
        type = 'codelldb';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        cwd = '{workspaceFolder}',
        rustPath = function()
          return '~/.cargo/bin/rustup'
        end;
      },
    }
