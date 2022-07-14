## Exports

export TERMINAL=alacritty
export EDITOR=nvim
export VISUAL=nvim
export PAGER=nvim
export BAT_THEME="TwoDark"
export TERM="xterm-256color"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export HOME=/home/ser
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export HOME=/Users/ser
fi

export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:$HOME/bin:$HOME/.local/bin:$HOME/scripts:$HOME/.dotnet/tools:/usr/local/go/bin:$HOME/go/bin:/opt/homebrew/bin

## Key bindings

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
   setxkbmap -option caps:none
   xmodmap .xmodmap
fi

## Aliases

# find (files), search (text) and view
alias f='fd'
alias s='rg'
alias ls='exa --long --no-user --header --icons --git --all --group-directories-first'
alias tree='exa --long --no-user --header --icons --git --all --group-directories-first --tree'

# processes
alias pui='htop'  # ui
alias pm='mprocs' # manager

# git
alias g='git'
alias gui='lazygit' # ui

# docker
alias dui='lazydocker' # ui

# kubernetes
alias kui='k9s' # ui

# nvim
alias v='nvim'
alias vd='nvim -d'

# tmux
alias t='tmux'
alias tnew='tmux new -s'
alias tattach='tmux attach -t'
alias tatt='tmux attach -t'
alias tdetach='tmux detach'
alias tdet='tmux detach'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# jupyter
alias jn='jupyter notebook'

# Codi
# Usage: codi [filetype] [filename]
# codi() {
#   local syntax="${1:-python}"
#   shift
#   nvim -c \
#     "let g:startify_disable_at_vimenter = 1 |\
#     set bt=nofile ls=0 noru nonu nornu |\
#     hi ColorColumn ctermbg=NONE |\
#     hi VertSplit ctermbg=NONE |\
#     hi NonText ctermfg=0 |\
#     Codi $syntax" "$@"
# }


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
. "$HOME/.cargo/env"
