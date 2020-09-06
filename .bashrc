#!/bin/bash
# Copyright (C) Sergio Hernandez - All Rights Reserved
# Author: Sergio Hernandez <contact.sergiohernandez@gmail.com>
# Date  : 25.08.2020
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
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
# export PS1="\[\033[38;2;229;192;123m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;2;224;108;117m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"
# export PS1="\[\033[38;2;86;182;194m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;2;224;108;117m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"
# export PS1="\[\033[38;2;229;192;123m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;2;86;182;194m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"
export PS1="\[\033[38;2;229;192;123m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;2;198;120;221m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"

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
