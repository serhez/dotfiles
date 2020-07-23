" (N)Vim Configuration File
" vim  : place in $HOME/.vimrc
" nvim : place in $HOME/.config/nvim/init.vim
" General settings
" ---------------------------------------------------------------------------
" drop vi support - kept for vim compatibility but not needed for nvim
set nocompatible

" number of lines at the beginning and end of files checked for file-specific vars
set modelines=0

" reload files changed outside of Vim not currently modified in Vim (needs below)
set autoread

" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !

" use Unicode
set encoding=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932

" errors flash screen rather than emit beep
set visualbell

" make Backspace work like Delete
set backspace=indent,eol,start

" don't create `filename~` backups
set nobackup
set nowritebackup

" don't create temp files
set noswapfile

" enables mouse scroll within tmux
set mouse=a

" update time
set updatetime=300

" line numbers and distances
set relativenumber 
set number 

" number of lines offset when jumping
set scrolloff=2

" Tab key enters 4 spaces
" To enter a TAB character when `expandtab` is in effect,
" CTRL-v-TAB
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 

" Indent new line the same as the preceding line
set autoindent

" statusline indicates insert or normal mode
set showmode showcmd

" make scrolling and painting fast
" ttyfast kept for vim compatibility but not needed for nvim
set ttyfast lazyredraw

" highlight matching parens, braces, brackets, etc
set showmatch

" http://vim.wikia.com/wiki/Searching
set hlsearch incsearch ignorecase smartcase

" As opposed to `wrap`
"set nowrap

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

" open new buffers without saving current modifications (buffer remains open)
set hidden

" Do not show preview window for completion
set completeopt-=preview

" http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu wildmode=list:longest,full

" StatusLine always visible, display full path
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2 statusline=%F

" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus

" Show character column
highlight ColorColumn ctermbg=DarkBlue
" set colorcolumn=80

" CursorLine - sometimes autocmds are not performant; turn off if so
" http://vim.wikia.com/wiki/Highlight_current_line
" set cursorline
" Normal mode
"highlight CursorLine ctermbg=None
"autocmd InsertEnter * highlight  CursorLine ctermbg=17 ctermfg=None
"autocmd InsertLeave * highlight  CursorLine ctermbg=None ctermfg=None

" MAPPINGS
" ---------------------------------------------------------------------------
" Tabs
" ---------------------------------------------------------------------------
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>                                                                            
nnoremap <C-l> :tabnext<CR>
" ---------------------------------------------------------------------------

" Plugins
" ---------------------------------------------------------------------------
call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Plug 'valloric/youcompleteme'
" Plug 'scrooloose/syntastic'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-obsession'
Plug 'pechorin/any-jump.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chrisbra/vim-diff-enhanced'
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-fugitive'
Plug 'sinetoami/lightline-hunks'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ludovicchabant/vim-gutentags'
call plug#end()
" ---------------------------------------------------------------------------

" VimDiff
" ---------------------------------------------------------------------------
" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

" Colors
" ---------------------------------------------------------------------------
"syntax enable
"set background=dark
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" One Dark
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1

syntax on
colorscheme onedark
" ---------------------------------------------------------------------------

" C++ Highlights
" ---------------------------------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
" ---------------------------------------------------------------------------

" Coc-nvim 
" ---------------------------------------------------------------------------
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

let g:lightline = {
	\ 'colorscheme': 'onedark',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'lightline_hunks', 'readonly', 'filename', 'modified' ] ],
    \   'right': [ ['lineinfo'], ['percent'], ['filetype'] ]
	\ },
	\ 'component_function': {
    \   'lightline_hunks': 'lightline#hunks#composer'
	\ },
	\ }

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" ---------------------------------------------------------------------------

" NERDTree
" ---------------------------------------------------------------------------
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
nnoremap <Leader>t :NERDTreeTabsToggle<Enter>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" ---------------------------------------------------------------------------

" Lightline Hunks
" ---------------------------------------------------------------------------
let g:lightline#hunks#only_branch = 1
" ---------------------------------------------------------------------------
