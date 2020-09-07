" type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

" Move to {char}
" map  <leader><leader>c <Plug>(easymotion-bd-f)
" nmap <leader><leader>c <Plug>(easymotion-overwin-f)

" Move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Move to line
" map <Leader><Leader>l <Plug>(easymotion-bd-jk)
" nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)

" Move to word
" map  <Leader><Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
