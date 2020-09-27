" map /  <Plug>(yeahhhhh-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

map / <Plug>(incsearch-easymotion-/)
map ? <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

set hlsearch
let g:yeahhhhh#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(yeahhhhh-nohl-#)
map g* <Plug>(yeahhhhh-nohl-g*)
map g# <Plug>(yeahhhhh-nohl-g#)

