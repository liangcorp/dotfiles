local keymap = vim.keymap

-- Telescope
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files,
    { desc = '[F]ind [F]iles' })
keymap.set('n', '<leader>fg', builtin.live_grep,
    { desc = '[F]ind by [G]rep' })
keymap.set('n', '<leader>fb', builtin.buffers,
    { desc = '[F]ind by [B]uffer' })
keymap.set('n', '<leader>fh', builtin.help_tags,
    { desc = '[F]ind [H]elp' })
keymap.set('n', '<leader>fo', builtin.oldfiles,
    { desc = '[F]ind [O]old files' })
keymap.set('n', '<leader>fw', builtin.grep_string,
    { desc = '[F]ind current [W]ord' })
keymap.set('n', '<leader>fd', builtin.diagnostics,
    { desc = '[F]ind [D]iagnostics' })
keymap.set('n', '<leader>fr', builtin.lsp_references,
    { desc = '[F]ind [R]eferences' })
