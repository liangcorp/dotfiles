    local dap = require('dap')
    dap.configurations.rust= {
      {
        type = 'rust';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        rustPath = function()
          return '~/.cargo/bin/rustup'
        end;
      },
    }
