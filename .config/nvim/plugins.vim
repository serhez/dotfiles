call plug#begin()

" One dark theme
Plug 'joshdick/onedark.vim'

" Vim Dev Icons
Plug 'ryanoasis/vim-devicons'

" Comments
Plug 'tpope/vim-commentary'

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'sinetoami/lightline-hunks'

" Ranger
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" Integration vim-tmux
Plug 'christoomey/vim-tmux-navigator'

" Auto pairing for braces, parentheses, etc.
Plug 'jiangmiao/auto-pairs'

" Saving sessions of vim (for saving tmux environments on system shutdown)
Plug 'tpope/vim-obsession'

" Highlighting for C/C++
Plug 'octol/vim-cpp-enhanced-highlight'

" Conquer Of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" VimDiff
Plug 'chrisbra/vim-diff-enhanced'

" Switch between header and implementation files
Plug 'vim-scripts/a.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'

" Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Interactive code
Plug 'metakirby5/codi.vim'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File header with copyright and other info
Plug 'alpertuna/vim-header'

" Convert binary, hex, etc..
Plug 'glts/vim-radical'

" Have the file system follow you around
Plug 'airblade/vim-rooter'

" Lots of great mappings
Plug 'tpope/vim-unimpaired'

" Better tabs
Plug 'mengelbrecht/lightline-bufferline'

" Search and replace
Plug 'dkprice/vim-easygrep'

" -----------------------------------------------------------------------------
" Graveyard
" -----------------------------------------------------------------------------

" NERDTree
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'

" Start Screen
" Plug 'mhinz/vim-startify'

" View and search symbols across directory
" Plug 'liuchengxu/vista.vim'

" Jump to definitions and references (alternative to Coc and language servers)
" Plug 'pechorin/any-jump.vim'

" Tags for completion and gotos (alternative to Coc and language servers)
" Plug 'ludovicchabant/vim-gutentags'

" GDB GUI
" Plug 'puremourning/vimspector'

" Completions and syntax highlighting (alternative to Coc)
" Plug 'valloric/youcompleteme'
" Plug 'scrooloose/syntastic'

" Multiple cursors like VSCode
" Plug 'terryma/vim-multiple-cursors'

" Better tabs
" Plug 'ap/vim-buftabline'

" Highlight all matches under cursor
" Plug 'RRethy/vim-illuminate'

call plug#end()

