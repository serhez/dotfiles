call plug#begin()


" ----  APPEARANCE  ----

" Themes
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'haishanh/night-owl.vim'

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'sinetoami/lightline-hunks'

" Vim Dev Icons
Plug 'ryanoasis/vim-devicons'

" Highlight search and replace patterns when using :%s/.../.../...
Plug 'markonm/traces.vim'

" VimDiff
Plug 'chrisbra/vim-diff-enhanced'

" Format the file
Plug 'sbdchd/neoformat'

" Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Better tabs
Plug 'mengelbrecht/lightline-bufferline'

" Concentration mode
Plug 'junegunn/goyo.vim'

" Add a fade to windows that you are not using
Plug 'tadaa/vimade'

" Visually display marks and bookmarks
Plug 'kshenoy/vim-signature'
Plug 'MattesGroeger/vim-bookmarks'

" Highlight yanked text
Plug 'machakann/vim-highlightedyank'


" ----  NAVIGATION  ----

" Ranger
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" Better in-file search
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'vim-scripts/IndexedSearch'

" Switch between header and implementation files
Plug 'vim-scripts/a.vim'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'

" Have the file system follow you around
Plug 'airblade/vim-rooter'

" Search and replace
Plug 'brooth/far.vim'

" Open a file at a line with 'nvim file.ext:34'
Plug 'bogado/file-line'

" Side-view of symbols and tags
Plug 'liuchengxu/vista.vim'


" ----    MOTIONS   ----

" Comments
Plug 'tpope/vim-commentary'

" A more comprehensive use of '.'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/visualrepeat'

" Auto pairing for braces, parentheses, etc.
Plug 'jiangmiao/auto-pairs'

" Change surroundings
Plug 'tpope/vim-surround'

" Better f and t
Plug 'rhysd/clever-f.vim'

" Add more text objects for better use of c.. y.. d..
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'  " Dependency of underscore textobj
Plug 'michaeljsmith/vim-indent-object'
Plug 'lucapette/vim-textobj-underscore'

" More motions to move around a file
Plug 'easymotion/vim-easymotion'

" Better w motion
Plug 'chaoren/vim-wordmotion'

" Improve gx when opening links, Github stuff...
Plug 'stsewd/gx-extended.vim'

" Multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Lots of great mappings
Plug 'tpope/vim-unimpaired'

" Exchange two words
Plug 'tommcdo/vim-exchange'

" Jump to matching symbol/word (e.g.: opening and closing parentheses) with %
Plug 'andymass/vim-matchup'

" Paste with indentation
Plug 'sickill/vim-pasta'


" ----      LSP     ----
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'


" ----    SCRIPTS   ----

" File header with copyright and other info
Plug 'alpertuna/vim-header'

" Convert binary, hex, etc..
Plug 'glts/vim-radical'

" Aligning lines based on a given symbol
Plug 'junegunn/vim-easy-align'

" Auto-reloading buffers when changed on disk
Plug 'mutewinter/vim-autoreadwatch'

" Open files at last edit position
Plug 'farmergreg/vim-lastplace'


" ---- INTEGRATIONS ----

" Integration vim-tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'

" Saving sessions of vim (for saving tmux environments on system shutdown)
Plug 'tpope/vim-obsession'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'mattn/vim-gist'

" Interactive code
Plug 'metakirby5/codi.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Jupyter notebooks
Plug 'goerz/jupytext.vim'
Plug 'GCBallesteros/vim-textobj-hydrogen'


call plug#end()


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

" Find visually selected text
" Plug 'haya14busa/vim-asterisk'

" To view register contents with " or @
" Plug 'junegunn/vim-peekaboo'

" To style tmux bar from vim
" Plug 'edkolev/tmuxline.vim'

" To highlight preview of f and t
" Plug 'hrsh7th/vim-eft'

" Recognise each word in a CamelCased identifier
" Plug 'bkad/CamelCaseMotion'

" Show nice indent lines
" Plug 'nathanaelkane/vim-indent-guides'

" Switch between oneliners and multiliners
" Plug 'AndrewRadev/splitjoin.vim'

" Conquer Of Completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Highlighting for C/C++
" Plug 'octol/vim-cpp-enhanced-highlight'

" Column text object
" Plug 'coderifous/textobj-word-column.vim'

" Highlight all matches under cursor
" Plug 'RRethy/vim-illuminate'

" Automatically resize windows based on focus
" WARNING: It messes popup windows size and position, like rnvimr
" Plug 'roman/golden-ratio'

