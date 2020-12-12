" Set leader key also to space
nnoremap <SPACE> <Nop>
map <SPACE> <leader>

" Buffers
nnoremap <silent>.  :bn<CR>
nnoremap <silent>,  :bp<CR>
nnoremap <leader>q  :bd<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Go to mark
nnoremap ; `
