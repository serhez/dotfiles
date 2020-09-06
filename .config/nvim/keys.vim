" Buffers
nnoremap <silent> <TAB>     :bn<CR>
nnoremap <silent> <S-TAB>   :bp<CR>
nnoremap <leader>l          :bn<CR>
nnoremap <leader>h          :bp<CR>
nnoremap <leader>x          :bd<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
