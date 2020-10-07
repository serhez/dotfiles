let g:coc_global_extensions = [
  \ 'coc-translator',
  \ 'coc-todolist',
  \ 'coc-sql', 
  \ 'coc-cssmodules', 
  \ 'coc-xml', 
  \ 'coc-texlab', 
  \ 'coc-python', 
  \ 'coc-java', 
  \ 'coc-json', 
  \ 'coc-html', 
  \ 'coc-css', 
  \ 'coc-cmake', 
  \ 'coc-clangd', 
  \ 'coc-tasks', 
  \ 'coc-sh', 
  \ 'coc-yank', 
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" make error texts have a red color
highlight CocErrorHighlight ctermfg=Red  guifg=#e06c76
highlight CocErrorSign ctermfg=Red  guifg=#e06c76

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <silent> rw <Plug>(coc-rename)

" Get yank list
nnoremap <silent> yl :<C-u>CocList -A --normal yank<cr>
let g:yank_limit = 10

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

