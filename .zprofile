## Exports

# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export PM_SHARE=/usr/share
    export PM_BIN=/usr/bin

# MacOS
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export TERMINFO=/usr/share/terminfo:$HOME/.terminfo

    architecture=$(uname -m)
    case $architecture in
        # Mac Intel silicon
        x86_64)
            export PM_SHARE=/usr/local/share
            export PM_BIN=/usr/local/bin
            ;;

        # Mac Apple silicon
        arm64)
            export PM_SHARE=/opt/homebrew/share
            export PM_BIN=/opt/homebrew/bin
            ;;
    esac
fi

export TERMINAL=wezterm
export EDITOR=nvim
export VISUAL=nvim
export PAGER=most
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="TwoDark"
export TERM="wezterm"

export PATH=$HOME/bin:$HOME/.local/bin:$HOME/scripts:$PM_BIN:$HOME/.dotnet/tools:/usr/local/go/bin:$HOME/go/bin:$PATH

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
alias ga='git add --all'
alias gb='git branch'
alias gC='git clone'
alias gc='git commit -m'
alias gd='git diff'
alias gm='git merge'
alias gk='git checkout'
alias gK='git checkout -b'
alias gp='git pull'
alias gP='git push'
alias gr='git rebase'
alias gR='git reset'
alias gS='git stash'
alias gs='git status'

# docker
alias dui='lazydocker' # ui

# kubernetes
alias kui='k9s' # ui

# nvim
alias v='nvim'
alias vd='nvim -d'
alias vui='neovide --multigrid --notabs' # ui

# tmux
alias t='tmux'
alias tnew='tmux new -s'
alias tattach='tmux attach -t'
alias tatt='tmux attach -t'
alias tdetach='tmux detach'
alias tdet='tmux detach'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# python
alias pyenv='python3 -m venv venv'
alias pyact='source ./venv/bin/activate'

# pip
alias pipupg='pip install --upgrade pip'
alias pipins='pip install'
alias pipinsreq='pip install -r'
alias piprm='pip uninstall'
alias pipmkreq='pip freeze > requirements.txt'

# conda
alias cupg='conda update -n base -c defaults conda'
alias cnew='conda create -n'
alias cenvls='conda env list'
alias cenvexp='conda env export >>'
alias cenvimp='conda env create -f'
alias cact='conda activate'
alias cdeact='conda deactivate'
alias cins='conda install'
alias cinsreq='conda install --file'
alias crm='conda remove'
alias cmkreq='conda list -e > requirements.txt'
alias cls='conda list'
alias ccln='conda clean --all'

cenvrm()
{
    conda env remove -n "$1" & conda clean --all
}

# jupyter
alias jn='jupyter notebook'

# document format conversions
md2pdf()
{
    pandoc "$1" --pdf-engine=xelatex --variable "geometry=margin=1.2in" --data-dir=~/.config/pandoc -o "$2"
}

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

. "$HOME/.cargo/env"

##
# Your previous /Users/ser/.zprofile file was backed up as /Users/ser/.zprofile.macports-saved_2022-09-20_at_15:20:28
##

# MacPorts Installer addition on 2022-09-20_at_15:20:28: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
