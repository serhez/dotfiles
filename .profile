#!/bin/zsh
# Copyright (C) Sergio Hernandez - All Rights Reserved
# Author: Sergio Hernandez <contact.sergiohernandez@gmail.com>
# Date  : 24.08.2020

# Exports
export TERMINAL=alacritty
export EDITOR=nvim
export VISUAL=nvim
export PAGER=nvim
export HOME=/home/ser
export BAT_THEME="TwoDark"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/bin:$HOME/.local/bin:$HOME/.dotnet/tools

# Key bindings
setxkbmap -option caps:none
xmodmap .xmodmap

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias vi='nvim'
alias vidiff='nvim -d'
alias suvi='sudo nvim'
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

