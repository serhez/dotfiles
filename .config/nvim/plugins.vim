call plug#begin()

" Themes
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'dracula/vim', { 'as': 'dracula' }

" Vim Dev Icons
Plug 'ryanoasis/vim-devicons'

" Comments
Plug 'tpope/vim-commentary'

" A more comprehensive use of '.'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/visualrepeat'

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

" Change surroundings
Plug 'tpope/vim-surround'

" More motions to move around a file
Plug 'easymotion/vim-easymotion'

" Better in-file search
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

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
Plug 'brooth/far.vim'

" Concentration mode
Plug 'junegunn/goyo.vim'

" Aligning lines based on a given symbol
Plug 'junegunn/vim-easy-align'

" Exchange two words
Plug 'tommcdo/vim-exchange'

" Jump to matching symbol/word (e.g.: opening and closing parentheses) with %
Plug 'andymass/vim-matchup'

" Visually display marks
Plug 'kshenoy/vim-signature'

" Add more text objects for better use of c.. y.. d..
Plug 'wellle/targets.vim'

" Highlight search and replace patterns when using :%s/.../.../...
Plug 'markonm/traces.vim'

" Add a fade to windows that you are not using
Plug 'tadaa/vimade'

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

" Find visually selected text
" Plug 'haya14busa/vim-asterisk'

" To view register contents with " or @
" Plug 'junegunn/vim-peekaboo'

call plug#end()

