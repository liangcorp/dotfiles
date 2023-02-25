local dap = require('dap')
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}
dap.configurations.javascript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require 'dap.utils'.pick_process,
    },
}
-- require("dap-vscode-js").setup({
--     -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
--     -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
--     -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
--     adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
--     -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
--     -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
--     -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
-- })
--
-- for _, language in ipairs({ "typescript", "javascript" }) do
--     require("dap").configurations[language] = {
--         {
--             {
--                 type = "pwa-node",
--                 request = "launch",
--                 name = "Launch file",
--                 program = "${file}",
--                 cwd = "${workspaceFolder}",
--             },
--             {
--                 type = "pwa-node",
--                 request = "attach",
--                 name = "Attach",
--                 processId = require 'dap.utils'.pick_process,
--                 cwd = "${workspaceFolder}",
--             }
--         },
--     }
-- end
