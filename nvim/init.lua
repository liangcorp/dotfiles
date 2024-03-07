-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local o = vim.o
o.nocompatible = true
o.autowrite = true
o.mouse = 'a'
o.mousemodel = 'popup'
o.guioptions = 'egmrti'
-- o.completeopt = "longest"
o.ruler = true
o.wildmenu = true
o.expandtab = true
-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'
-- o.spelllang = en_GB
-- o.spell = true
vim.scriptencoding = 'UTF-8'

local opt = vim.opt
opt.tabstop = 4
opt.softtabstop = 0
opt.shiftwidth = 4
opt.smartindent = true
opt.encoding = 'UTF-8'
-- vim.opt.autoindent = true
opt.showcmd = true
opt.cmdheight = 1
-- vim.opt.ignorecase = true
opt.smarttab = true
-- vim.opt.breakindent = true
opt.number = true
-- opt.relativenumber = true
opt.path = vim.opt.path + '**'

-- Set highlight on search, but clear on pressing <Esc> in normal mode
opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- opt.cursorcolumn=true
opt.cursorline = true

-- set termguicolors to enable highlight groups
opt.termguicolors = true

vim.g.zig_fmt_autosave = 0
vim.g.loaded_perl_provider = 0

-- Remove whitespace on save
local autocmd = vim.api.nvim_create_autocmd
autocmd('BufWritePre', {
    pattern = '',
    command = ":%s/\\s\\+$//e"
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- NOTE: commented out configs are lazy loaded via plugins
require('plugins')

-- Themes
o.background = "dark"
-- vim.cmd 'colorscheme habamax'
vim.cmd 'colorscheme nord'
-- require('themes/onedark')

-- Statusline without Plugins
require('config/statusline')

-- LSP configurations
-- require('lsp/config')
-- require('lsp/completion')
-- require('lsp/bash')

-- Keyboard keymaps
-- require('keymaps/aerial')
require('keymaps/basic')
require('keymaps/lsp')
-- require('keymaps/debugger')
-- require('keymaps/telescope')
-- require('keymaps/harpoon')

-- Aerial for indexing/traversing definitions
-- require('navigation/aerialline')

-- Telescope for fuzzy finding
-- require('navigation/telescopeconfig')

-- Trouble window
require('navigation/diagnostics')

-- Debugger nvim-dap
-- require('dap/config')

-- DAP for c/cpp/rust
-- require('dap/adapters')

require('gitsigns').setup()

-- DAP for javascript and typescript
-- require('dap/javascript')
