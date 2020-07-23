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
# PS1='[\u@\h \W]\$ '
export PS1="\[\033[38;5;6m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;215m\]>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
