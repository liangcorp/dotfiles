-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local o = vim.o
-- o.nocompatible = true
o.autowrite = true
o.mouse = 'a'
o.mousemodel = 'popup'
-- o.guioptions = 'egmrti'
o.ruler = true
o.wildmenu = true
o.expandtab = true
-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'
-- o.completeopt = "longest"
-- o.spelllang = en_GB
-- o.spell = true

vim.scriptencoding = 'UTF-8'

local opt = vim.opt
opt.tabstop = 4
opt.softtabstop = 0
opt.shiftwidth = 4
opt.smartindent = true
opt.encoding = 'UTF-8'
opt.showcmd = true
opt.cmdheight = 1
opt.smarttab = true
opt.number = true
opt.path = vim.opt.path + '**'
opt.cursorline = true
-- opt.cursorcolumn=true
-- opt.autoindent = true
-- opt.ignorecase = true
-- opt.relativenumber = true
-- opt.breakindent = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


-- set termguicolors to enable highlight groups
opt.termguicolors = true

-- vim.g.zig_fmt_autosave = 0
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

-- Statusline without Plugins
require('config/statusline')

-- LSP configurations
-- require('lsp/config')
-- require('lsp/completion')
-- require('lsp/bash')

-- Keyboard keymaps
require('keymaps/basic')
require('keymaps/lsp')
-- require('keymaps/aerial')
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

--------------- Theme -----------------------
-- vim.cmd [[
-- hi Function guifg='#61afef'
-- hi Comment guifg='green'
-- hi Normal guifg='#abb2bf' "guibg='#1e2127'
-- hi Constant guifg='#d19a66'
--
-- hi Statement guifg='#abb2bf'
-- " hi Conditional guifg='#95B9C7'
-- " hi Repeat guifg='#95B9C7'
-- " hi Keyword guifg='#95B9C7'
-- " hi Label guifg='silver'
-- " hi Operator guifg='silver'
-- " hi Exception gui=bold guifg='silver'
--
-- hi Preproc guifg='green'
-- " hi PreCondit guifg='#007C80'
-- hi Include guifg='#95B9C7'
-- hi Macro guifg='#95B9C7'
-- hi Define guifg='#14A3C7'
--
-- hi String guifg='#98c379'
-- hi Type guifg='#e5c07b'
--
-- hi Special guifg='#e06c75'
-- hi SpecialChar guifg='#e06c75'
-- hi SpecialComment guifg='#08A04B'
-- ]]

------------------ One Dark -------------------
-- vim.cmd [[
-- hi Function guifg='#61afef'
-- hi Comment guifg='#5c6370'
-- hi Normal guifg='#abb2bf' guibg='#1e2127'
-- hi Constant guifg='#d19a66'
-- hi Statement guifg='#c678dd'
-- hi Keyword guifg='#c678dd'
-- hi Conditional guifg='#c678dd'
-- hi Operator guifg='silver'
-- hi Exception gui=bold guifg='silver'
-- hi Label guifg='silver'
-- hi Repeat guifg='#c678dd'
-- hi Type guifg='#e5c07b'
-- hi PreCondit guifg='#c678dd'
-- hi Include guifg='#c678dd'
-- hi Macro guifg='silver'
-- hi String guifg='#98c379'
-- hi SpecialChar guifg='#e06c75'
-- hi SpecialComment guifg='green'
-- ]]
