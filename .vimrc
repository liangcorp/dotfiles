syntax enable
"filetype plugin on
filetype plugin indent on

set nocompatible
set number
set tabstop=4
set path+=**
set wildmenu

colorscheme dracula
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
" Plug 'wfxr/minimap.vim'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Initialize plugin system
call plug#end()

let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
"let g:ale_sign_error = '❌'
"let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

let g:rustfmt_autosave = 1

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"let g:minimap_width = 10
"let g:minimap_auto_start = 1
"let g:minimap_auto_start_win_enter = 1
"let g:minimap_block_filetypes = ['txt']
"let g:minimap_highlight_search = 1
