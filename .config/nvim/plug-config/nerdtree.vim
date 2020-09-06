let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let g:nerdtree_tabs_autofind = 1
let g:nerdtree_tabs_open_on_new_tab = 0
nnoremap <Leader>t :NERDTreeTabsToggle<Enter>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
