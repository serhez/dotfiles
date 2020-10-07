nmap <leader>f :RnvimrToggle<CR>

" Make Ranger replace netrw and be the file explorer
let g:rnvimr_enable_ex = 1
let g:rnvimr_draw_border = 1

" Make Ranger to be hidden after picking a file
" let g:rnvimr_pick_enable = 1

" Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1

" Set up only two columns in miller mode and draw border with both
let g:rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"
            \ --cmd="set draw_borders both"'

" Change the border's color
let g:rnvimr_border_attr = {'fg': '#e06c76', 'bg': '#e06c76'}
let g:rnvimr_presets = [
            \ {'width': 0.800, 'height': 0.800}]

" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

