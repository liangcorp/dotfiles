local keymap = vim.keymap

-- Neotest
local neotest = require("neotest")
keymap.set("n", "<leader>tt", function()
    neotest.run.run()
end, { desc = 'Run Nearest [T]est' })

keymap.set("n", "<leader>tf", function()
    neotest.run.run(vim.fn.expand("%"))
end, { desc = '[T]est Current File' })

keymap.set("n", "<leader>ts", function()
    neotest.run.stop()
end, { desc = '[S]top [T]est' })

keymap.set("n", "<leader>ta", function()
    neotest.run.attach()
end, { desc = '[T]est [A]ttrach' })

keymap.set("n", "<leader>to", function()
    neotest.output.open({ enter = false })
end, { desc = '[O]pen Output' })

keymap.set("n", "<leader>tp", function()
    neotest.output_panel.open()
end, { desc = 'Open [T]est [P]anel' })

keymap.set("n", "<leader>tP", function()
    neotest.output_panel.close()
end, { desc = 'Close [T]est [P]anel' })
