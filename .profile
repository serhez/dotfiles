#!/bin/zsh
# Copyright (C) Sergio Hernandez - All Rights Reserved
# Author: Sergio Hernandez <contact.sergiohernandez@gmail.com>
# Date  : 24.08.2020

# Exports
export TERMINAL=alacritty
export EDITOR=nvim
export VISUAL=nvim
export PAGER=nvim
export BAT_THEME="TwoDark"
export TERM="xterm-256color"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export HOME=/home/ser
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/bin:$HOME/.local/bin:$HOME/.dotnet/tools
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export HOME=/Users/Ser
    export VIRTUALENVWRAPPER_PYTHON=$(which python3)
    export WORKON_HOME=~/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Key bindings
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    setxkbmap -option caps:none
    xmodmap .xmodmap
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # TODO
fi

# Aliases
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
    alias grep='grep -G'
fi
alias v='nvim'
alias vi='nvim'
alias suv='sudo nvim'
alias suvi='sudo nvim'
alias vd='nvim -d'
alias vdiff='nvim -d'
alias vidiff='nvim -d'
alias suvd='sudo nvim -d'
alias suvdiff='sudo nvim -d'
alias suvidiff='sudo nvim -d'
alias jn='jupyter notebook'
alias new='tmux new -s'
alias attach='tmux attach -t'
alias att='tmux attach -t'
alias detach='tmux detach'
alias det='tmux detach'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  nvim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
