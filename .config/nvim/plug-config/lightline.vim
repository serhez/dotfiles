function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'lightline_hunks', 'readonly', 'filename', 'modified' ] ],
    \   'right': [ ['lineinfo'], ['percent'], ['filetype'], ['lsp_status'] ]
	\ },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': [ [] ]
    \ },
    \ 'component_expand': {
    \   'buffers':    'lightline#bufferline#buffers',
    \   'lsp_status': 'LspStatus'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel',
    \   'lsp_status': 'middle'
    \ },
	\ 'component_function': {
    \   'lightline_hunks': 'lightline#hunks#composer'
	\ }
	\ }

let g:lightline.component_raw               = {'buffers': 1}
let g:lightline#bufferline#unnamed          = '[No Name]'
let g:lightline#bufferline#enable_devicons  = 1
let g:lightline#bufferline#unicode_symbols  = 1
let g:lightline#bufferline#clickable        = 1
let g:lightline#bufferline#show_number      = 0
let g:lightline#hunks#only_branch           = 1

let g:lightline.colorscheme = 'nord'

" Mappings
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

