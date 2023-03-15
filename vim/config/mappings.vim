let mapleader="\\"

" Move blocks up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep curser in the same position
nnoremap J mzJ`z

" Keey curser in the same position during move
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Paste over the highlighted word with copied word
xnoremap <Leader>p "\"_dP

" Keep curser during search
nnoremap n nzzzv
nnoremap N Nzzzv

" Formatting using Coc
nnoremap <space>f :Format<CR>
" Fuzzy finder
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <Leader>fh :Helptags<CR>

" VIM Test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

