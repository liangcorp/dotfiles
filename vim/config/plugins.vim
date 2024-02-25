call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Use by everything
Plug 'sheerun/vim-polyglot'

" Status line
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Rust lang related
Plug 'rust-lang/rust.vim'

" Git related
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File tree
" Plug 'preservim/nerdtree'

" Treesitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Fuzzy finder
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" VIM Test
Plug 'vim-test/vim-test'

" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Debug
" Plug 'puremourning/vimspector'

" Themes
Plug 'joshdick/onedark.vim'

" Initialize plugin system
call plug#end()
